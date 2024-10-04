alldots :: Num a => [(a, a)] -> [(a, a)] -> [a]
alldots xs ys = [x1 * y1 + x2 * y2 | (x1, x2) <- xs, (y1, y2) <- ys]

-- testcase: alldots [(1, 1), (2, 2)] [(10, 10), (100, 100)]