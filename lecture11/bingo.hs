data W x = Bingo x 
    deriving Show

instance Functor W where
    fmap f (Bingo x) = Bingo (f x)

instance Applicative W where
    pure x = Bingo x
    -- <*> :: (Bingo (a -> b) -> Bingo a -> Bingo b)
    (Bingo f) <*> (Bingo x) = Bingo (f x)

instance Monad W where
    return x = Bingo x
    Bingo x >>= f = f x

wrapadd x y = do
    a <- x
    b <- y
    return (a*b)