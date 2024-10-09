pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- Concerning the definition this solution lack the internal relations between the variables.
pyths2 n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x <= y && y < z && z <= n, x^2 + y^2 == z^2]
-- Alternative, where we include the other values as bound for the generators:
pyths3 n = [(x, y, z) | z <- [1..n], y <- [1..z-1], x <- [1..y], x^2 + y^2 == z^2]
