letters2 = do
    w <- getLine
    sequence_ (map (putStrLn . show) w)

letters2' = do
    w <- getLine
    sequence_ (map (\x -> putStrLn[x]) w) 