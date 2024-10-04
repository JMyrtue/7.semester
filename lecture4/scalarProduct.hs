-- scalar :: [Int] -> [Int] -> Int
-- scalar xs ys = [ | x <- xs, y <- ys, x * y]


-- Far from the solution here:
sp xs ys = sum [xs !! i * ys !! i | i <- [0..n-1]]
           where n = length xs

-- simpler solution:
sp2 xs ys = sum [x * y | (x, y) <- zip xs ys]