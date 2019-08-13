module Parser
    (parseOp)
    where

import Control.Applicative ((<|>))
import Control.Monad (void)
import qualified Data.Attoparsec.Combinator
import Data.Attoparsec.Text
import Data.Text (Text)
import Data.String
import Expr

operator :: Parser Char
operator = (char '+') <|>
            (char '-') <|>
            (char '*') <|>
            (char '/')

opParser :: Fractional a => Parser (Expr a)
opParser = do
    n1 <- rational
    skipSpace
    o <- operator
    skipSpace
    n2 <- rational
    return $ Op o (Val n1) (Val n2)

parseOp :: Fractional a => String -> Either String (Expr a)
parseOp s = parseOnly opParser (fromString s :: Text)