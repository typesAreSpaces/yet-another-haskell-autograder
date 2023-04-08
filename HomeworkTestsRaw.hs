homeworkTests :: [Problem]
homeworkTests =
  [
    Problem {
      title = "Basic arithmetic - Part 1",
      description = "Use (+) to add two numbers",
      tests = [
        Test {
          name = "Exercise 1",
          score = 1,
          exprToTest = "(+) 2 2",
          testHandler = "(\\ans -> ans == 4)",
          typeWitness = 0 :: Int
        },
        Test {
          name = "Exercise 2",
          score = 1,
          exprToTest = "(+) 3 2",
          testHandler = "(\\ans -> ans == 5)",
          typeWitness = 0 :: Int
        }
      ]
    }, 
    Problem {
      title = "Basic arithmetic - Part 2",
      description = "Use (*) to multiply two numbers",
      tests = [
        Test {
          name = "Exercise 1",
          score = 1,
          exprToTest = "(*) 2 2",
          testHandler = "(\\ans -> ans == 4)",
          typeWitness = 0 :: Int
        },
        Test {
          name = "Exercise 2",
          score = 1,
          exprToTest = "(*) 3 2",
          testHandler = "(\\ans -> ans == 6)",
          typeWitness = 0 :: Int
        }
      ]
    },
    Problem {
      title = "Using lists",
      description = "Hmm typed languages",
      tests = [
        Test {
          name = "Exercise 6",
          score = 1,
          exprToTest = "g 10",
          testHandler = "(\\ans -> (length ans) == 11)",
          typeWitness = [] :: [Int]
        }
      ]
    },
    Problem {
      title = "Basic arithmetic - Part 1 - again",
      description = "Use (+) to add two numbers",
      tests = [
        Test {
          name = "Exercise 1",
          score = 1,
          exprToTest = "(+) 2 2",
          testHandler = "(\\ans -> ans == 3)",
          typeWitness = 0 :: Int
        },
        Test {
          name = "Exercise 2",
          score = 1,
          exprToTest = "(+) 3 2",
          testHandler = "(\\ans -> ans == 5)",
          typeWitness = 0 :: Int
        }
      ]
    },
    Problem {
      title = "Basic arithmetic - Part 2 - again",
      description = "Use (*) to multiply two numbers",
      tests = [
        Test {
          name = "Exercise 3",
          score = 1,
          exprToTest = "(*) 2 2",
          testHandler = "(\\ans -> ans == 4)",
          typeWitness = 0 :: Int
        },
        Test {
          name = "Exercise 4",
          score = 1,
          exprToTest = "(*) 3 2",
          testHandler = "(\\ans -> ans == 5)",
          typeWitness = 0 :: Int
        },
        Test {
          name = "Exercise 5",
          score = 1,
          exprToTest = "f 1",
          testHandler = "(\\ans -> ans == 2)",
          typeWitness = 0 :: Int
        }
      ]
    }
  ]
