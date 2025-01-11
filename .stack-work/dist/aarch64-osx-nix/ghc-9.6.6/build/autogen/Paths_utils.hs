{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_utils
  
  (
    version,
    getBinDir,
    getLibDir,
    getDynLibDir,
    getLibexecDir,
    getDataFileName,
    getDataDir,
    getSysconfDir
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




bindir     :: FilePath
bindir     = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/bin"
getBinDir     :: IO FilePath
getBinDir     = catchIO (getEnv "utils_bindir")     (\_ -> return bindir)

libdir     :: FilePath
libdir     = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/lib/aarch64-osx-ghc-9.6.6/utils-0.1.0.0-IdP4UTsOs8o2jKvFrsyxsu"
getLibDir     :: IO FilePath
getLibDir     = catchIO (getEnv "utils_libdir")     (\_ -> return libdir)

dynlibdir  :: FilePath
dynlibdir  = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/lib/aarch64-osx-ghc-9.6.6"
getDynLibDir  :: IO FilePath
getDynLibDir  = catchIO (getEnv "utils_dynlibdir")  (\_ -> return dynlibdir)

datadir    :: FilePath
datadir    = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/share/aarch64-osx-ghc-9.6.6/utils-0.1.0.0"
getDataDir    :: IO FilePath
getDataDir    = catchIO (getEnv "utils_datadir")    (\_ -> return datadir)

libexecdir :: FilePath
libexecdir = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/libexec/aarch64-osx-ghc-9.6.6/utils-0.1.0.0"
getLibexecDir :: IO FilePath
getLibexecDir = catchIO (getEnv "utils_libexecdir") (\_ -> return libexecdir)

sysconfdir :: FilePath
sysconfdir = "/Users/sable/Desktop/Programming/Haskell/utils/.stack-work/install/aarch64-osx-nix/f52bb1ceea93fe15a3df1e622e47df41956a75a023ad59400e8066f4a20f9ce9/9.6.6/etc"
getSysconfDir :: IO FilePath
getSysconfDir = catchIO (getEnv "utils_sysconfdir") (\_ -> return sysconfdir)



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
