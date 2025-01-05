-- onlytwo :: [a] -> Bool
onlytwo [_,_] = True
onlytwo _     = False

-- alldots :: Num a => [(a,a)] -> [(a,a)] -> [a]
alldots xs ys = [ a * c + b * d | (a,b) <- xs, (c,d) <- ys]

idhead ((x,y):_) | x == y    = True
                 | otherwise = False
--ad hoc polymorphic because the type parameters are constrained by the Eq type class.

-- pyt :: Int a => a -> [(a,a,a)]
pyt n = [(a, b, c) | a <- [1..n], b <- [1..n], c <- [1..n], a <= b && b < c, a*a + b*b == c*c]

-- bighead :: Ord a => [a] -> Int 
bighead (x:xs) = sum [1 | x' <- xs, x' > x]

plonk :: Num a => a -> a -> a -> a
plonk = (\x -> (\y -> (\z -> x+y+z)))

divisors n = [x | x <- [1..n-1], n `mod` x == 0]

isperfect n = sum (divisors n) == n

-- sevens :: Int -> [Int]
sevens n = [x | x <- [1..n], x `mod` 7 == 0] 

-- flop :: [(a,b)] -> [(b,a)]
flop xs = [(y, x) | (x, y) <- xs]

-- dupli :: [a] -> [a]
dupli xs = concat [x : [x] | x <- xs]

sums m n = zip [x | x <- [1..m]] [y | y <- [1..n]]