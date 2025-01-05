--replicate :: Int -> a -> [a]
repli 0 _ = []
repli n x = x : repli (n-1) x 

--improve :: [a] -> [a]
improve []       = []
improve [x]      = [x]
improve (x:_:xs) = x : improve xs

--rev :: [a] -> [a]
rev []     = []
rev (x:xs) = rev xs ++ [x]

--desc :: Ord a => [a] -> Bool
desc [] = True
desc [_] = True
desc (x:y:xs) = if x < y 
                    then False
                    else desc (y:xs)

-- wrapup explained from Hüttel video:
wrapup []     = []
wrapup [x]    = [[x]]
wrapup (x:xs) = if x == h
                then (x:fst):rst
                else [x] : (fst:rst)
                where fst:rst = wrapup xs
                      (h:t)   = fst

triples :: [(a1, a2, a3)] -> ([a1], [a2], [a3])
triples [] = ([], [], [])
triples [(a, b, c)] = ([a], [b], [c])
triples ((x,y,z):xs) = (x:xs', y:ys', z:zs')
                    where 
                        (xs', ys', zs') = triples xs

