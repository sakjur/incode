{-# LANGUAGE OverloadedStrings #-}

import System.Environment
import System.Posix.Files
import Text.Printf

data DecibyteFile = DecibyteFile {
  name :: String,
  size :: Integer 
} deriving (Show)

-- log10(n) * 10
log10size :: Integer -> Double
log10size size = (logBase 10 (fromIntegral size)) * 10

-- Get the metadata for a specific file
stat_file :: String -> IO DecibyteFile
stat_file str = do
    stat <- getFileStatus str
    let size = toInteger (fileSize stat)
    return (DecibyteFile str size)

decibyte_files :: [String] -> Integer -> IO () 
decibyte_files xs i
  | null xs = printf "%9.2fdBy === TOTAL ===\n" (log10size i)
  | otherwise = do
    stat <- stat_file (head xs)
    printf "%9.2fdBy %s\n" (log10size (size stat)) (name stat)
    decibyte_files (tail xs) (i+(size stat))

main :: IO ()
main = do
  a <- getArgs;
  decibyte_files a 0
