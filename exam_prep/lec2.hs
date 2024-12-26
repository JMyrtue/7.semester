--second :: [a] -> a
second xs = xs !! 1

--allbutsecond :: [a] -> [a]
allbutsecond (x:xs) = x : (tail xs)

--midtover :: [a] -> ([a], [a])
midtover xs = (take mid xs, drop mid xs)
              where
                mid = (length xs `div` 2)


n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]
-- invalid backticks
-- function name must not be capital letter
-- indentation level of the where clauses


-- Bonus exercises:
last' :: [a] -> a
last' xs = head (reverse xs)


qsort :: (Ord a) => [a] -> [a]

qsort [] = []
qsort (x:xs) = big ++ [x] ++ small
                 where small = qsort [a | a <- xs, a <= x]
                       big   = qsort [a | a <- xs, a > x]