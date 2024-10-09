sevens :: Int -> [Int]
sevens n = [x | x <- [1..n], x `mod` 7 == 0] 