homeworkTests :: [Problem]
homeworkTests =
  [
    Problem {
      title = "stutter",
      description = "",
      tests = [
        Test {
          name = "Test 1",
          score = 1,
          exprToTest = "stutter \"Hello World\"",
          testHandler = "(\\ans -> ans == \"HHeelllloo  WWoorrlldd\")",
          typeWitness = [] :: [Char]
        },
        Test {
          name = "Test 2",
          score = 1,
          exprToTest = "stutter [1, 2, 3]",
          testHandler = "(\\ans -> ans == [1, 1, 2, 2, 3, 3])",
          typeWitness = [] :: [Int]
        },
        Test {
          name = "Test 3",
          score = 1,
          exprToTest = "stutter []",
          testHandler = "(\\ans -> ans == [])",
          typeWitness = [] :: [Int]
        },
        Test {
          name = "Test 4",
          score = 1,
          exprToTest = "stutter [1, 2]",
          testHandler = "(\\ans -> length ans == 2 * length [1 , 2])",
          typeWitness = [] :: [Int]
        }
      ]
    },
    Problem {
      title = "compress",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "findIndices",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "isPrefixOf",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "isSuffixOf",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "Dot product",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "increasing",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "decimate",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "encipher",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "prefixSum",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "select",
      description = "",
      tests = [
      ]
    },
    Problem {
      title = "numbers",
      description = "",
      tests = [
      ]
    }
  ]
