module Reverse where

import Data.List.Split

rvrs :: String -> String
rvrs str = unwords . reverse $ splitOn " " str

main = print $ rvrs "Curry is awesome"
