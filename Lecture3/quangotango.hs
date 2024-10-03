
quango :: a -> [a]
quango x = [x]

tango (x, y) z = 5

-- ChatGPT helped
-- tango2 (x, y) z = fromIntegral (length (show x) + length (show y)) + 1

-- Ord x, Integral y => [x] -> y


f x y (a, b) = if x == y then min a b else max a b