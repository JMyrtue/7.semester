-- sums m n = [x | x <- [y | <- [1..m]]]

sums2 m n = [[x + y | y <- [1..n]] | x <- [1..m]]