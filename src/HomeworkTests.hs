module HomeworkTests ( homeworkTests ) where

import Grader

homeworkTests :: [Problem]
homeworkTests =
  [
    Problem {
      title = "Number of ones in Zeckendorf representations",
      description = "Count the number of ones in Zeckenderf representation given a list of integers",
      tests = [
          Test {
            name = "Test 1",
            score = 1,
            exprToTest = "numberOfOnes [1]",
            testHandler = "(\\ans -> ans == 1)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 2",
            score = 1,
            exprToTest = "numberOfOnes [1, 2]",
            testHandler = "(\\ans -> ans == 1)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 3",
            score = 1,
            exprToTest = "numberOfOnes [1 .. 10]",
            testHandler = "(\\ans -> ans == 4)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 4",
            score = 1,
            exprToTest = "numberOfOnes [2, 3, 5, 7]",
            testHandler = "(\\ans -> ans == 0)",
            typeWitness = 0 :: Integer
          }
      ]
    }
  ]
