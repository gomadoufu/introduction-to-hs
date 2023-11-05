{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_parallel_sample (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/bin"
libdir     = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/lib/x86_64-osx-ghc-9.4.7/parallel-sample-0.1.0.0-8gXB8umiGsa2cu5sKcIWN7-parallel-sample"
dynlibdir  = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/lib/x86_64-osx-ghc-9.4.7"
datadir    = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/share/x86_64-osx-ghc-9.4.7/parallel-sample-0.1.0.0"
libexecdir = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/libexec/x86_64-osx-ghc-9.4.7/parallel-sample-0.1.0.0"
sysconfdir = "/Users/gomadoufu/ghq/github.com/gomadoufu/introduction-to-hs/parallel-sample/.stack-work/install/x86_64-osx/209b608439af6de655b97aeda0ada194e1bc702b77937d6ed8f19c6a81e3e3d0/9.4.7/etc"

getBinDir     = catchIO (getEnv "parallel_sample_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "parallel_sample_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "parallel_sample_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "parallel_sample_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "parallel_sample_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "parallel_sample_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
