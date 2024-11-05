freq :: String -> [(Char, Int)]
freq []     = []
freq (x:xs) = update x fl
              where fl = freq xs

update x [] = [(x, 1)]
update x ((y, f):ys) | x == y = (x, f+1):ys
update x ((y, f):ys) | x /= y = (y, f) : update x ys
