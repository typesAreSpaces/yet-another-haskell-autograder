module Tester
    ( errorString
    , handleProblems
    ) where

import Text.Printf (printf)

import qualified Grader                       as Gr
import qualified Data.List                    as L
import qualified Language.Haskell.Interpreter as HInt

import qualified System.Timeout    as Timeout
import qualified Control.Exception as Excpt

type FeedbackPath    = String
type SubmissionPath  = String
type Score           = Int
type Scores          = [Score]
type Problems        = [Gr.Problem]
type HInterp         = HInt.Interpreter
type SandBoxedResult = Either Excpt.SomeException (Maybe Bool)

errorString :: HInt.InterpreterError -> String
errorString (HInt.WontCompile es) =
  L.intercalate "\n" (header : map unbox es)
  where
    header = "ERROR: Won't compile:"
    unbox (HInt.GhcError e) = e
errorString e = show e

sayIO :: FeedbackPath -> String -> IO ()
sayIO feedbackFile s =
  appendFile feedbackFile s

sayH :: FeedbackPath -> String -> HInterp ()
sayH feedbackFile s = HInt.liftIO
  $ sayIO feedbackFile s 

handleTest :: FeedbackPath -> SubmissionPath -> Gr.Test -> HInterp Score
handleTest
  feedbackFile
  submissionPath
  test@(Gr.Test _ cScore expr handler witness) =
  do
    HInt.loadModules        [submissionPath]
    HInt.setTopLevelModules ["SubmissionHandler"] 
    HInt.setImportsQ        [("Prelude", Nothing)]

    exprToVal <- HInt.interpret expr witness
    currTest  <- HInt.interpret handler (\_ -> True)
    sayH feedbackFile "\n"
    sandboxedResult <- HInt.liftIO
      $ Excpt.try
      $ Timeout.timeout 1000
      $ Excpt.evaluate (currTest exprToVal) :: HInterp SandBoxedResult
    case sandboxedResult of
      Left excpt
        -> do
        sayH feedbackFile $ Gr.showTestHeader test False
        sayH feedbackFile $ "          Caught exception: " ++ show excpt ++ "\n"
        return 0
      Right Nothing
        -> do
        sayH feedbackFile $ Gr.showTestHeader test False
        sayH feedbackFile $ "          Caught exception: Timeout\n"
        return 0
      Right (Just isCorrect)
        -> do
        sayH feedbackFile $ Gr.showTestHeader test isCorrect 
        sayH feedbackFile $ Gr.showTestFeedback test isCorrect (show exprToVal)
        return (if isCorrect then cScore else 0)

handleProblem :: FeedbackPath -> SubmissionPath -> Gr.Problem -> IO Scores
handleProblem
  feedbackFile
  submissionPath
  problem@(Gr.Problem title description cTests) =
  let
    runTest test = do
      output <- HInt.runInterpreter
        $ handleTest feedbackFile submissionPath test 
      case output of
        Left err
          -> do
          sayIO feedbackFile $ printf "          %s\n" (errorString err)
          sayIO feedbackFile $ "\n"
          return 0
        Right score
          -> do
          return score 
  in
  do 
    sayIO feedbackFile $ printf "%s:\n" title
    sayIO feedbackFile $ printf "          %s\n" description
    m <- mapM runTest cTests
    sayIO feedbackFile $ Gr.showProblemResult problem m
    return m

handleProblems :: FeedbackPath -> SubmissionPath -> Problems -> IO ()
handleProblems
  feedbackFile
  submissionPath
  problems =
  do
    m <- mapM (handleProblem feedbackFile submissionPath) problems
    sayIO feedbackFile $ Gr.showFinal
      (sum $ map sum $ m)
      (sum $ map Gr.totalScoreProblem $ problems)
    return ()
