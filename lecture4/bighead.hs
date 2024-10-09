bighead :: Ord a => [a] -> Int
bighead [] = 0
bighead (x:xs) = sum [1 | y <- xs, y > x]   

