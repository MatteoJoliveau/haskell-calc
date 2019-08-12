{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment
import Data.String
import Data.Text (Text)
import Data.Attoparsec.Text
import Data.Function
import Parser
import Expr

main :: IO ()
main = do 
  args <- getArgs
  s <- (return . fromString) $ head args
  r <- return $ parseOnly parseOp s
  case r of
    Right e -> print $ (eval e :: Float)
    Left e -> print e
