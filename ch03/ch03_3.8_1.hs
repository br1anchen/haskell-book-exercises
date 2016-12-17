-- f1 str = str ++ "!"
f1 :: String -> String
f1 = (++"!")

f2 :: String -> String
f2 str = ((take 1).(drop 4)) str

f3 :: String -> String
-- f3 str = drop 9 str
f3 = drop 9
