-- fact :: (Num a, Enum a) => a -> a
fact k = product [1..k]

-- approx :: (Fractional b, Enum b) => b -> b
approx n = sum (map (\x -> 1 / fact x) [0..n])