module UtilsBitsTest where

import Utils.Data.Bits
import Test.HUnit

testShiftRInfix = "testShiftRInfix" ~: assertEqual "should shift bits right" 2 (4 .>>. 1 :: Int)

testShiftLInfix = "testShiftLInfix" ~: assertEqual "should shift bits left" 8 (4 .<<. 1 :: Int)
