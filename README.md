# Haskell Calc

A small program to teach myself [Haskell](https://haskell.org). It reads a simple expression from the command line and evaluates it.  

## Prerequisites
[Haskell Stack](https://haskellstack.org) version 1.9 or later is needed to build the project.  
Run `stack setup` in the repo to install and configure the correct Haskell compiler.

## Build and run
Run `stack run -- '1 + 1'` to try it. You can insert any expression, whitespaces are automatically ignored.

## Install locally
Run `stack install`, it will install the `calc` executable in your `PATH`.

## Expressions
Here is a list of supported expressions. Unmarked lines are not yet implemented.
- [x] the four basic operations                 `+`, `-`, `*`, `/`
- [ ] nested expressions with parenthesis   `(1 + 2) * 3`
- [ ] power `2^2`
- [ ] power with exponent expression `2^(3-2)`
- [ ] square root `sqrt(4)`
- [ ] percentage operations `100 - 20%`
