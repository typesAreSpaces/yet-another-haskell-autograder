homeworkTests :: [Problem]
homeworkTests =
  [
    Problem {
      title = "Dot product",
      description = "",
      tests = [
          Test {
            name = "Test 1",
            score = 1,
            exprToTest = "dot [0, 0, 1] [0, 1, 0]",
            testHandler = "(\\ans -> ans == 0)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 2",
            score = 1,
            exprToTest = "dot [0, 0, 1] [0, 1, 1]",
            testHandler = "(\\ans -> ans == 1)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 3",
            score = 1,
            exprToTest = "dot [1, 0, 1] [1, 1, 1]",
            testHandler = "(\\ans -> ans == 2)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 4",
            score = 1,
            exprToTest = "dot [-1, 1, 2] [1, -1, 1]",
            testHandler = "(\\ans -> ans == 0)",
            typeWitness = 0 :: Integer
          }
      ]
    },
    Problem {
      title = "numbers",
      description = "",
      tests = [
          Test {
            name = "Test 1",
            score = 1,
            exprToTest = "numbers [1 .. 4]",
            testHandler = "(\\ans -> ans == 1234)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 2",
            score = 1,
            exprToTest = "numbers [10 .. 15]",
            testHandler = "(\\ans -> ans == 101112131415)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 3",
            score = 1,
            exprToTest = "numbers [1 .. 10]",
            testHandler = "(\\ans -> ans == 12345678910)",
            typeWitness = 0 :: Integer
          },
          Test {
            name = "Test 4",
            score = 1,
            exprToTest = "numbers [1 .. 1]",
            testHandler = "(\\ans -> ans == 1)",
            typeWitness = 0 :: Integer
          }
      ]
    }
  ]
