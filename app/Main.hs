{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment
import System.Console.ParseArgs
import Parser
import Expr

main :: IO ()
main = do 
  args <- getArgs
  r <- return $ parseOp (head args)
  case r of
    Right e -> print $ (eval e :: Float)
--    Right e -> print e
    Left e -> print e
