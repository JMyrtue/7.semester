wrapup :: Eq a => [a] -> [[a]]
wrapup []     = []
wrapup (x:xs) = (x : l1) : wrapup l2
            where
                (l1, l2) = ident x xs


-- ident :: Eq a => [a] -> a -> ([a], [a])
ident _ []     = ([], [])
ident y (x:xs) = if x == y then (x : l1, l2)
                   else ([], (x:xs))
                   where (l1,l2) = ident x xs



-- wrapup [x,y] | x == y       = [x, y]
--              | otherwise    = [x], [y]
-- wrapup (x:y:xs) | x == y    = 
--                 | otherwise =