desc :: Ord a => [a] -> Bool
desc []     = True
desc [_]    = True
desc (x:y:xs) | x < y = False 
              | otherwise = desc (y:xs)