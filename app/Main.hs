{-# LANGUAGE ExistentialQuantification #-}

module Main (main) where

import Tester        ( handleProblems )
import HomeworkTests ( homeworkTests  )

import qualified System.Environment           as Env
import qualified System.Directory             as Dir

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
        handleProblems feedbackFile submissionFile homeworkTests
        return 0
    else do
      handleProblems feedbackFile submissionFile homeworkTests
      return 0
