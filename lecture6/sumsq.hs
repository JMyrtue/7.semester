-- sumsq :: Int -> Int
sumsq n = foldr (\x acc -> x^2 + acc) 0 [1..n]
-- sumsq = foldr ((+) . (^2)) 0 [1..n] - Solution by another student.