import Data.Char

hello = do putStrLn "What is your name?" 
           x <- getLine
           putStrLn ("Hello " ++ x)

letters = do xs <- getLine
             printer xs

printer []     = return ()
printer (x:xs) = do putChar x
                    putChar '\n'
                    printer xs


letters' = do xs <- getLine
              sequence_ (map (\x -> putStrLn[x]) xs) 
              sequence_ (map (putStrLn . show) xs)
 

hugorm = do putStr "How many numbers would you like to add? "
            n <- getLine
            sum <- getSum ((read n) :: Int) 0
            putStrLn (show sum)
            
getSum 0 sum = return sum
getSum n sum = do x <- getLine
                  getSum (n-1) (sum + ((read x) :: Int))