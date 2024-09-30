
quango :: a -> [a]
quango x = [x]
tango (x, y) z = x + y + z

-- ChatGPT helped
tango2 :: Num p1 => (a, b) -> p2 -> p1
tango2 (x, y) z = fromIntegral (length (show x) + length (show y)) + 1