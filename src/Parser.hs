module Parser
    (parseOp)
    where

import Control.Applicative
import Control.Monad (void)
import Data.Attoparsec.Combinator
import Data.Attoparsec.Text
import Data.Text (Text)
import Data.String
import Debug.Trace
import Expr

-- Like manyTill, but pack the result to Text.
--textTill :: Alternative f => f Char -> f b -> f Text
--textTill p end = pack <$> manyTill p end

operator :: Parser Char
operator = (char '+') <|>
            (char '-') <|>
            (char '*') <|>
            (char '/')

scopeStart :: Parser Char
scopeStart = char '('

scopeEnd :: Parser Char
scopeEnd = char ')'

scopeParser :: Fractional a => Parser (Expr a)
scopeParser = do
  scopeStart
  e <- opParser
  scopeEnd
  return $ Scope e

valueParser :: Fractional a => Parser (Expr a)
valueParser = do
  n <- rational
  return $ Val n

opParser :: Fractional a => Parser (Expr a)
opParser = do
    skipSpace
    rs1 <- choice [valueParser, scopeParser]
    skipSpace
    o <- operator
    skipSpace
    rs2 <- choice [valueParser, scopeParser]
    skipSpace
--    endOfLine
--    if (not end)
--    then opParser
    return $ Op o rs1 rs2

--exprParser :: Fractional a => Parser (Expr a)
--exprParser = many1 opParser


parseOp :: Fractional a => String -> Either String (Expr a)
parseOp s = parseOnly opParser (fromString s :: Text)
