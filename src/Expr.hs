module Expr
  where

data Expr a = Val a
            | Op Char (Expr a) (Expr a)
            | Scope (Expr a)
             deriving (Eq, Show)

eval :: Fractional a => Expr a -> a
eval (Val n) = n
eval (Op o x y) = execOp o n m
                  where
                    n = eval x
                    m = eval y
eval (Scope e) = eval e

execOp :: Fractional a => Char -> a -> a -> a
execOp '+' n m = n + m
execOp '-' n m = n - m
execOp '*' n m = n * m
execOp '/' n m = n / m
