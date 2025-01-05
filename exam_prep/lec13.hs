nsonly n = [ x * n | x <- [0..]]

nsonly_rec n = f 0
    where
        f x = (x * n) : f (x + 1)


plip = fst (17, f 484000)
    where f x = f (x + 1)
-- Expect the value to be 17, as the outermost expression would be fst, which would simply evaluate to 17.

x = 1 : (map (+1) x)
-- take 5 x, should evaluate to [1,2,3,4,5] due to the following stack trace.
-- take 5 x
-- take 5 (1 : map (+1) x)
-- take 5 (1 : 2 : map (+1) x)
-- 1 : take 4 (2 : 3 : map (+1) x)
-- 1 : 2 : take 3 (3 : 4 : map (+1) x)
-- 1 : 2 : 3 take 2 (4 : 5 : map (+1) x)
-- 1 : 2 : 3 : 4 take 1 (5 : map (+1) x)
-- 1 : 2 : 3 : 4 : 5 = [1,2,3,4,5]

fibsfrom n1 n2 = n1 : fibsfrom n2 (n1 + n2)

fibs n = take n (fibsfrom 1 1)

fibonacci = zipWith (+) l (tail l)
    where
        l = [1..]
