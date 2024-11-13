hugorm = do
    putStr "How many numbers would you like to add?"
    amount <- getLine
    totalSum <- calcSum ((read amount) :: Int) 0
    putStrLn(show totalSum)

calcSum a n | a == 0    = return n
            | otherwise = do
                inp <- getLine
                calcSum (a - 1) (n + ((read inp) :: Int))
