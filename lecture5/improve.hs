improve :: [a] -> [a]
improve []     = []
improve [x]    = [x]
improve (x:xs) = x : improve (tail xs)