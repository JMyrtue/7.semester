indflet _ [] = []
indflet _ [x] = [x]
indflet e (x:y:ys) = x : e : indflet e (y:ys)


fletind _ [] = []
fletind e (x:xs) = x : e : fletind e (xs)
fletind _ [x] = [x]
