tuple :: Monad m => m a -> m b -> m (a, b)
tuple x y = x >>= (\a -> y >>= (\b -> return (a,b)))

tuple' x y = do a <- x
                b <- y
                return (x,y)


-- z >>= (\y -> s y >>= (\_ return (f y)))

fourfirst xs = do
                 x <- xs
                 return (4,x)
-- It returns a list of pairs, where each pair is 4 paired with the individual elements of xs

data W x = Bingo x 
    deriving Show

instance Functor W where
    fmap f (Bingo x) = Bingo (f x)

instance Applicative W where
    pure x = Bingo x
    (Bingo g) <*> (Bingo x) = Bingo (g x)

instance Monad W where
    return x      = Bingo x
    Bingo x >>= f = f x

wrapadd :: Num b => W b -> W b -> W b
wrapadd b1 b2 = do x <- b1
                   y <- b2
                   return (x * y)

data Tree a = Leaf a | Node (Tree a) (Tree a)

-- minmax :: Monad a => Tree a -> (a, a)
minmax (Leaf a)   = Just (a, a)
minmax (Node l r) = do (x1, y1) <- minmax l
                       (x2, y2) <- minmax r
                       if y1 <= x2 then return (x1, y2) else Nothing

minorder t = do (x,y) <- minmax t
                return x

mytree1 = Node (Node (Leaf 1) (Leaf 2)) (Leaf 2)
mytree2 = Node (Node (Leaf 3) (Leaf 2)) (Leaf 1)
