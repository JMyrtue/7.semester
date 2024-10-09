idhead :: Eq a => [(a, a)] -> Bool
idhead [] = False
idhead ((x, y):_) = x == y
