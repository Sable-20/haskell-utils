{-# OPTIONS_HADDOCK prune #-}

{-|
Module          : Utils
Description     : A small module designed by myself to hold utility functions
License         : MIT
Maintainer      : Sable Ayala <sable262021@gmail.com>
-}
module Utils (
  -- * The main file and place that holds things that don't belong to anything specific

  -- * Operators #operators#
  (!@),

  -- ** Named for of operators #named-operators#
  extract,
) where

  
-- | The `!@` function is an infix function that takes a start and end integer.
--  It will split the string from position `from` to position `to` (inclusive). 
--
-- >>> "hello world" !@ (2,5)
-- "llo"
(!@) :: [a] -> (Int, Int) -> [a]
(!@) str (from, to) = drop from $ take (to + 1) str

-- | The named form of the '(!@)' infix operator
extract :: [a] -> (Int, Int) -> [a]
extract str (from, to) = str !@ (from, to)