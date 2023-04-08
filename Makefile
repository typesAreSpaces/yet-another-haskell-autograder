test: bin/haskell-grader-exe
	./scripts/grader $$(pwd) test/HomeworkTestsRaw.hs submissions feedback with-errors 0

bin/haskell-grader-exe: src/HomeworkTests.hs
	stack build --copy-bins

.PHONY: clean

clean:
	stack clean
	rm -rf bin
