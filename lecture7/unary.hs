data Unary = Z | I Unary

unary2int :: Unary -> Int
unary2int Z = 0
unary2int (I n) = 1 + (unary2int n)