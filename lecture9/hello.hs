hello :: IO ()
hello = do putStrLn "What is your name?"
           name <- getLine
           putStrLn ("Hello " ++ name)
           return ()


-- sequence_ [putStr "rip", putStr "rap", return ()]
-- Executes the sequence of actions provided.
-- What's its difference to "do"?

-- sequence_ [putStr "rip", putStr "rap", getChar]
-- Complains because sequence_ is of type "IO ()", while getChar is of type "IO Char" 