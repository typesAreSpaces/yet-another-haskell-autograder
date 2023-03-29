{-# LANGUAGE ExistentialQuantification #-}

module Grader (module Grader) where

import Text.Printf   (printf)
import Data.Typeable (Typeable)

import qualified Color as C

-- methods and data structures used for verifying the solutions 
-- and displaying the results

data Problem =
  Problem {
    title       :: String,
    description :: String,
    tests       :: [Test]
  } deriving Typeable

data Test =
  forall a. (Typeable a, Show a) =>
    Test {
      name        :: String,
      score       :: Int,
      exprToTest  :: String,
      testHandler :: String,
      typeWitness :: a
    } deriving Typeable

type Tests    = [Test]
type Problems = [Problem]

totalScoreProblem :: Problem -> Int
totalScoreProblem (Problem _ _ cTests) = sum $ map score $ cTests

showResult :: Int -> Int -> String
showResult scored total =
    showScore (C.resultColor scored total) scored total

showFinal :: Int -> Int -> String
showFinal scored total =
    showTotal (C.resultColor scored total) scored total

showScore :: C.Color -> Int -> Int -> String
showScore color scored total =
    C.paint color $ printf "\n    Score: [%d/%d]\n" scored total

showTotal :: C.Color -> Int -> Int -> String
showTotal color scored total =
    C.paint color $ printf "Total: [%d/%d]" scored total

showTest :: Test -> Bool -> String -> String
showTest
  (Test cName _ expr handler _)
  isCorrect
  studentAnswer = 
    let
        label = if isCorrect then C.paint C.Green "PASS" else C.paint C.Red "FAIL"
        header = printf "    %s  %s\n" label cName
        feedback1 = printf "          Input: %s\n          Test:  %s\n"
          expr handler
        feedback2 = printf "          Your code returned:  %s\n"
          $ C.paint (if isCorrect then C.Green else C.Red) studentAnswer
    in header ++ feedback1 ++ feedback2

showProblemResult :: Problem -> [Int] -> String
showProblemResult problem scores =
  let total  = totalScoreProblem problem
      scored = sum scores
      result = showResult scored total
      header = printf "%s\n" result
  in header
