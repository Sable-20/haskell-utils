{-|
Module          : Utils.Data.Bits
Description     : Submodule within Utils to deal with bits
License         : MIT
Maintainer      : Sable Ayala <sable262021@gmail.com>
Author          : Henning Thielemann <haskell@henning-thielemann.de>

This code was borrowed from `https://hackage.haskell.org/package/utility-ht-0.0.17.2/docs/src/Data.Bits.HT.html` written by Henning Thielemann.
-}
module Utils.Data.Bits (
  (.<<.),
  (.>>.),
) where

import Data.Bits (Bits, shiftL, shiftR)

infixl 7 .<<., .>>.

{- |
Infix variant of 'shiftL'.
Precedence is chosen like multiplication since @a .<<. k == a * 2^k@.
-}
(.<<.) :: Bits a => a -> Int -> a
(.<<.) = shiftL

{- |
Infix variant of 'shiftR'.
Precedence is chosen like division since @a .>>. k == a / 2^k@.
-}
(.>>.) :: Bits a => a -> Int -> a
(.>>.) = shiftR