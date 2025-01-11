module Main where
import Utils
import Test.HUnit
import qualified System.Exit as Exit

testStringSplitInfix :: Test
testStringSplitInfix = TestCase (assertEqual "Should return indices 2 to 5 of the string inclusive" "llo " ("hello world" !@ (2,5)))

tests :: Test
tests = TestList [TestLabel "testStringSplitInfix" testStringSplitInfix]

main :: IO ()
main = do
  result <- runTestTT tests
  if failures result > 0 then putStrLn "Tests failed" else Exit.exitSuccess
