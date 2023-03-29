module Tester
    ( errorString
    , handleProblems
    ) where

import Text.Printf (printf)

import qualified Grader                       as Gr
import qualified Data.List                    as L
import qualified Language.Haskell.Interpreter as HInt

type FeedbackPath   = String
type SubmissionPath = String
type Score          = Int
type Scores         = [Score]
type Problems       = [Gr.Problem]
type HInterp        = HInt.Interpreter

errorString :: HInt.InterpreterError -> String
errorString (HInt.WontCompile es) = L.intercalate "\n" (header : map unbox es)
  where
    header = "ERROR: Won't compile:"
    unbox (HInt.GhcError e) = e
errorString e = show e

say :: FeedbackPath -> String -> HInterp ()
say feedbackFile s = HInt.liftIO
  $ appendFile feedbackFile s

handleTest :: FeedbackPath -> SubmissionPath -> Gr.Test -> HInterp Score
handleTest
  feedbackFile
  submissionPath
  test@(Gr.Test _ cScore expr handler witness) =
  do
    ---------------------------------------------
    -- TODO: Consider renaming
    -- module for the submission handler
    HInt.loadModules        [submissionPath]
    HInt.setTopLevelModules ["SubmissionHandler"] 
    ---------------------------------------------
    HInt.setImportsQ [("Prelude", Nothing)]
    exprToVal <- HInt.interpret expr witness
    currTest  <- HInt.interpret handler (\_ -> True)
    say feedbackFile "\n"
    if (currTest exprToVal) then
      do
        say feedbackFile $ Gr.showTest test True (show exprToVal)
        return cScore
    else
      do
        say feedbackFile $ Gr.showTest test False (show exprToVal)
        return 0

handleProblem :: FeedbackPath -> SubmissionPath -> Gr.Problem -> HInterp Scores
handleProblem
  feedbackFile
  submissionPath
  problem@(Gr.Problem title description cTests) =
  do 
    say feedbackFile $ printf "%s:\n" title
    say feedbackFile $ printf "          %s\n" description
    m <- mapM (handleTest feedbackFile submissionPath) cTests
    say feedbackFile $ Gr.showProblemResult problem m
    return m

handleProblems :: FeedbackPath -> SubmissionPath -> Problems -> HInterp ()
handleProblems
  feedbackFile
  submissionPath
  problems =
  do
    m <- mapM (handleProblem feedbackFile submissionPath) problems
    say feedbackFile $ Gr.showFinal
      (sum $ map sum $ m)
      (sum $ map Gr.totalScoreProblem $ problems)
    return ()
