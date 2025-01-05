--Exprsssions
-- (Ord a, Num a) => a -> a -> [[Bool]] -> Bool
expr1 x y bs = if x + 1 > y then head (head bs) else False

-- Num a => (t -> a, t) -> a -> a
expr2 (f, x) y = f x + y 

-- Fractional t1 => (t2 -> t1) -> (t2 -> t1) -> (t1 -> t3) -> t2 -> t3
expr3 f g h x =  h ((f x) / (g x))

triples :: Num a => [(a,a,a)] -> ([a], [a], [a])
triples []             = ([], [], [])
triples [(x,y,z)]      = ([x], [y], [z])
triples ((x,y,z) : rest) = ( x : xs, y : ys, z : zs)
                         where
                            (xs, ys, zs) = triples rest

class InVector a where
    (&&&) :: a -> a -> a
    (***) :: a -> a -> Bool

instance InVector Bool where
    True &&& True = True
    _    &&& _    = False

    True *** True = True
    _    *** _    = False

-- frequencies :: [Char] -> [(Char, Int)]
frequencies []     = []
frequencies (x:xs) = update x freq
                     where
                        freq = frequencies xs

update :: Char -> [(Char, Int)] -> [(Char, Int)]
update x []                      = [(x, 1)]
update x ((c, i):xs) | x == c    = (c, i + 1) : xs
                     | otherwise = (c, i) : update x xs


data Enc a = Entry String a [Enc a]
    deriving Show

layered (Entry s v []) = True
layered (Entry s v xs) = all (v <) rooted
                         && layered simpletree
                         where
                            rooted              = map root xs
                            root (Entry _ w _)  = w
                            subs (Entry _ _ xs) = xs
                            m                   = maximum rooted
                            simpletree          = (Entry "temp" m (pullup xs))
                            pullup trees        = concat (map subs trees)

t1 = Entry "mango" True 
    [ Entry "dingo" False 
        [ Entry "plip" True [],
        Entry "ninka" False []
        ],
    Entry "plop" True [],
    Entry "plys" False 
        [ Entry "boing" True []
        ]
    ]   


t2 = Entry "plonk" 1 
    [ Entry "zap" 3 
        [ Entry "ninka" 8 []
        ],
    Entry "uhu" 4 
        [ Entry "gif" 7 []
        ],
    Entry "bingo" 5 []
    ]