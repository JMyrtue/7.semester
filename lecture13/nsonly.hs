nsonly :: Int -> [Int]
nsonly n = [n * x | x <- [0..]]

nsonly' :: Int -> [Int]
nsonly' n = f 0
    where
        f x = (x * n) : f (x + 1)




-- Exercise 2:
-- Due to lazy evaluation the value is 17, as we do not evaluate the infinite execution of the second value of the tuple.