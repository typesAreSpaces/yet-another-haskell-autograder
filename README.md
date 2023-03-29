# haskell-grader

## Dependencies

- stack
- ghcup (needed for macOs)

It's recommended to install these packages using the `brew` package manager.

## Build

At the root of the project, execute the following command:
```
stack build
```

## Usage

1. Write a test case `testcase.hs`. The current format should use the `Problem` data structure 
defined in `src/Grader.hs`.

2. To evaluate a single submission `submission.hs` execute the command
```
./scripts/grader <PATH-TO-HASKELL-GRADER> testcase.hs submission.hs feedback with-errors <ENABLE-OVERWRITE>
```

To evaluate a several submissions in the directory `submissions` execute the command
```
./scripts/grader <PATH-TO-HASKELL-GRADER> testcase.hs submissions feedback with-errors <ENABLE-OVERWRITE>
```

`feeback` and `with-errors` are directories where the feedback and copies of faulty submissions 
is stored. `<ENABLE-OVERWRITE>` is a variable that allows the grader to overwrite already existing feedback files by setting it to `1`. To disable this feature use `0`.

## Acknowledgements

The following projects serve as inspiration for this project:

- [haskell-autograder](https://github.com/danalizieors/haskell-autograder): 
  - Color support was taking from it.
  - Overall design is similar but scores are given to each test instead of each problem.
  - This project uses string comparisions to test submissions. Our project relies on the library [hint](https://github.com/haskell-hint/hint) to evaluate haskell code.
- [haskelltester](https://github.com/sweirich/haskelltester): 
