within :: (Num a, Ord a) => [a] -> (a, a) -> [a]
within xs (a, b) = filter (\x -> x >= a && x <= b) xs