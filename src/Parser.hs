module Parser
    (parseOp)
    where

import Control.Applicative ((<*>),
                            (*>),
                            (<$>),
                            (<|>),
                            pure)
import Control.Monad (void)
import qualified Data.Attoparsec.Text
import qualified Data.Attoparsec.Combinator
import Data.Attoparsec.Text (Parser, char, rational, skipSpace)
import Data.Text (Text)
import Expr

operator :: Parser Char
operator = (char '+') <|>
            (char '-') <|>
            (char '*') <|>
            (char '/')

parseOp :: Fractional a => Parser (Expr a)
parseOp = do
    n1 <- rational
    skipSpace
    o <- operator
    skipSpace
    n2 <- rational
    return $ Op o (Val n1) (Val n2)
