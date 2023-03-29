{-# LANGUAGE ExistentialQuantification #-}

module Main (main) where

import Tester        ( errorString
                     , handleProblems )
import HomeworkTests ( homeworkTests  )

import qualified System.Environment           as Env
import qualified System.Exit                  as Exit
import qualified System.Directory             as Dir
import qualified Language.Haskell.Interpreter as HInt

main :: IO Int
main =
  do
    args            <- Env.getArgs
    submissionFile  <- return $ args !! 0
    feedbackFile    <- return $ args !! 1
    enableOverwrite <- return $ args !! 2
    if ("0" == enableOverwrite) then do
      checkFeedbackFile <- Dir.doesFileExist feedbackFile
      if checkFeedbackFile then do
        putStrLn "Feedback exists and overwrite wasn't enabled"
        return 0
      else do
        processProblems feedbackFile submissionFile       
    else do
      processProblems feedbackFile submissionFile       

processProblems :: String -> String -> IO Int
processProblems feedbackFile submissionFile = do 
  output <- HInt.runInterpreter
            $ handleProblems feedbackFile submissionFile homeworkTests
  case output of
    Left err@(HInt.WontCompile _)
      -> do
      putStrLn $ errorString err
      Exit.exitWith (Exit.ExitFailure 1)
    Left err@(HInt.UnknownError _)
      -> do
      putStrLn $ errorString err
      Exit.exitWith (Exit.ExitFailure 2)
    Left err@(HInt.NotAllowed _)
      -> do
      putStrLn $ errorString err
      Exit.exitWith (Exit.ExitFailure 3)
    Left err@(HInt.GhcException _)
      -> do
      putStrLn $ errorString err
      Exit.exitWith (Exit.ExitFailure 4)
    Right _
      -> Exit.exitWith Exit.ExitSuccess
