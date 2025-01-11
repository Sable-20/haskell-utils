{-|
Module          : Utils
Description     : A small module designed by myself to hold utility functions
-}
module Utils (
  (!@),
) where

  
{-|
  The `!@` function is an infix function that takes a start and end integer.
  It will split the string from position `from` to position `to` (inclusive). 
-}
(!@) :: [Char] -> (Int, Int) -> [Char]
(!@) str (from, to) = drop from $ take (to + 1) str
