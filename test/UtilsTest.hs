module Main where
import Utils
import Test.HUnit

import UtilsBitsTest

import qualified System.Exit as Exit

testStringSplitInfix :: Test
testStringSplitInfix = TestCase (assertEqual "Should return indices 2 to 5 of the string inclusive" "llo " ("hello world" !@ (2,5)))

testIntListSplitInfix :: Test
testIntListSplitInfix = TestCase (assertEqual "Should return indices of 3 to 6 of the list of integers" [1, 2, 3, 4] ([0, 4, 2, 1, 2, 3, 4, 8] !@ (3,6)))

testStringExtract :: Test
testStringExtract = TestCase (assertEqual "Should return indices 2 to 5 of the string used inclusive" "llo " (Utils.extract "hello world" (2,5)))

testIntListExtract :: Test
testIntListExtract = TestCase (assertEqual "Should return indices of 3 to 6 of the list of integers" [1, 2, 3, 4] (Utils.extract [0, 4, 2, 1, 2, 3, 4, 8] (3,6)))

tests :: Test
tests = TestList [
  TestLabel "testStringSplitInfix" testStringSplitInfix, 
  TestLabel "testStringExtract" testStringExtract, 
  TestLabel "testIntListSplitInfix" testIntListSplitInfix, 
  TestLabel "testIntListExtract" testIntListExtract,
  TestLabel "testShiftRInfix" UtilsBitsTest.testShiftRInfix,
  TestLabel "testShiftLInfix" UtilsBitsTest.testShiftLInfix]

main :: IO ()
main = do
  result <- runTestTT tests
  if failures result > 0 then putStrLn "Tests failed" else Exit.exitSuccess
