import Data.List.Split

rvrs :: String
-- rvrs = three ++ " " ++ two ++ " " ++ one
--   where str = "Curry is awesome"
--         one = take 5 str
--         two = ((take 2) . (drop 6)) str
--         three = drop 9 str
rvrs = unwords . reverse $ splitOn " " "Curry is awesome"
