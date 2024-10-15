improve :: [a] -> [a]
improve []     = []
improve [x]    = [x]
improve (x:_:xs) = x : improve xs