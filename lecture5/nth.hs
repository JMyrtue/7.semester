nth :: [a] -> Int -> a
nth xs 0 = head xs
nth [] _ = []
nth (x:xs) n = nth xs (n-1)