tuple :: Monad m => m a -> m b -> m (a, b)
tuple ma mb = ma >>= (\a -> mb >>= (\b -> return (a, b)))

tuple' ma mb = do
    a <- ma
    b <- mb
    return (a, b)

-- In the case of the Maybe type the return value would be 'Nothing' if either of 'a' or 'b' was Nothing, otherwise it would return a Just tuple.

-- ghci> tuple (Just 1) (Just 2)
-- Just (1,2)

-- ghci> tuple' (Nothing) (Just 10)
-- Nothing


--------
-- Exercise 2:

-- Definition of '>>=':
---- m a -> (a -> m b) -> m b

-- z >>= (\y -> s y >>= (\_ -> return (f y))) 