flop :: [(a, b)] -> [(b, a)]
flop xs = [(y, x) | (x, y) <- xs]