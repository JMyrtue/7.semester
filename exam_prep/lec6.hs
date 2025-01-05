--positions :: [Char] -> [Int]
positions xs = map (\x -> x - 96) (map fromEnum xs)


-- sumsq :: Int -> Int
sumsq n = foldr (\x n -> x^2 + n) 0 [1..n]
-- sumsq = foldr ((+) . (^2)) 0 [1..n]


-- dbs :: Num a => [(a, a)] -> [(a, a)]
dbs = filter (\(x,y) -> x*2 == y) 


-- within :: Num a, Ord a => [a] -> (a, a) -> [a]
within xs (x,y) = filter (\z -> z >= x && z <= y) xs


sumrows :: Num a => [[a]] -> [a]
sumrows = map sum

-- fact :: (Num a, Enum a) => a -> a
fact k = product [1..k]

-- approx :: (Fractional b, Enum b) => b -> b
approx n = sum (map (\x -> 1 / fact x) [0..n])

-- partition :: (a -> Bool) -> [a] -> ([a], [a])
partition p xs = (filter p xs, filter (not . p) xs)

partition' p xs = foldr (\x (m, nm) -> if p x then (x : m, nm) else (m, x : nm)) ([],[]) xs


foldfilt p = foldr (\x acc -> if p x then x : acc else acc) []

remove xs = foldr (\x acc -> if x `elem` xs then acc else x : acc) []

-- map map :: [a -> b] -> [[a] -> [b]]