module Main where

import Data.Bool ( bool )
import Data.List ( sort, isSuffixOf )
import Data.Time
import System.Environment ( getArgs, getProgName )
import System.Directory ( listDirectory )
import System.FilePath ( (</>), isExtensionOf, takeFileName )
import System.IO ( hGetContents )
import System.Process
    ( createProcess,
      shell,
      CreateProcess(std_out),
      StdStream(CreatePipe) )

main :: IO ()
main = do
    probid:_ <- getArgs
    fs <- sort . filter (isExtensionOf "txt") <$> listDirectory ("test" </> "case" </> probid </> "in")
    let ins  = map (("test" </>) . ("case" </>) . (probid </>) . ("in" </>)) fs
    let outs = map (("test" </>) . ("case" </>) . (probid </>) . ("out" </>)) fs
    loop probid ins outs

loop :: String -> [FilePath] -> [FilePath] -> IO ()
loop _   []     _      = return ()
loop cmd (i:is) (o:os) = do
    start <- getCurrentTime
    cp@(_, Just hout, _, _)
            <- createProcess 
                (shell ("stack exec -- " ++ cmd 
                 ++ " < " ++ i))
                { std_out = CreatePipe }
    out0 <- hGetContents hout
    out1 <- filter (/= '\r') <$> readFile o
    let msg = bool "WA" "AC" (out0 == out1)
    putStr (takeFileName i ++ ": " ++ msg ++ " : ")
    end <- getCurrentTime
    print (diffUTCTime end start)
    loop cmd is os
