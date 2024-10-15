merge :: Ord a => [a] -> [a] -> [a]
merge xs []          = xs
merge [] xs          = xs
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a] = [a]
msort xs = merge (msort (take n xs)) (msort (drop n xs))
           where
             n = length xs `div` 2

-- msort does not work as is.