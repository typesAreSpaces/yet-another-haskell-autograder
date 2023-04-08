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
