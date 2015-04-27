module Main where

import Prelude hiding (FilePath)
import Filesystem.Path.CurrentOS (extension, filename, encodeString)
import System.FSNotify (withManager, watchTree, eventPath, Event)
import System.FSNotify.Devel (existsEvents)
import qualified System.Process as P
import Control.Concurrent (threadDelay)
import Control.Monad (forever)
import Data.List (isPrefixOf)

myAction :: Event -> IO ()
myAction event = do
    P.callProcess "C:\\WINDOWS\\SYSTEM32\\eventcreate.EXE"
      ["/T", "ERROR", "/ID", "999", "/L", "APPLICATION", "/SO", "alerter", "/D", path]
    P.callCommand $ "msg \"%username%\" /TIME:100000000 File changed: " ++ path
    return ()
  where
    path = encodeString $ eventPath event

main :: IO ()
main = withManager $ \mgr -> do
    watchTree
      mgr
      "C:\\ProgramData\\CovenantEyes"
      (existsEvents isMajorLog)
      myAction

    -- sleep forever (until interrupted)
    forever $ threadDelay maxBound
  where
    isMajorLog path = extension path == Just "log" && "major-" `isPrefixOf` encodeString (filename path)
