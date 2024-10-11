and2 :: [Bool] -> Bool
and2 []     = True
and2 (x:xs) = if x == True then and2 xs else False