-- positions :: String -> [Int]
positions []   = []
positions xs = map (\y -> y-96) [fromEnum x | x <- xs]