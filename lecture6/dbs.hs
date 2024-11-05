dbs :: (Eq a, Num a) => [(a, a)] -> [(a, a)]
dbs xs = filter (\(x, y) -> x*2 == y) xs