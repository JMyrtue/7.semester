data Onion a = Layer (Onion a) | Core a
    deriving Show 

instance Functor Onion where
    -- fmap :: (a -> b) -> Onion a -> Onion b
    fmap g (Layer o) = Layer (fmap g o)
    fmap g (Core a) = Core (g a)

data UTree a = Node a [UTree a]
    deriving Show

instance Functor UTree where
    -- fmap :: (a -> b) -> UTree a -> UTree b
    fmap g (Node x xs) = Node (g x) [fmap g x' | x' <- xs]

t1 = (Node 1 [(Node 4 []), (Node 10 [])])

prodthree xs ys zs = pure (\a b c -> a * b * c) <*> xs <*> ys <*> zs

data Exp a = Var a | Val Int | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a)
    deriving Show

instance Functor Exp where
    -- fmap :: (a -> b) -> Exp a -> Exp b
    fmap g (Var x) = Var (g x)
    fmap g (Val x) = Val x
    fmap g (Add x y) = Add (fmap g x) (fmap g y)
    fmap g (Mult x y) = Mult (fmap g x) (fmap g y)

-- ghci> fmap (+1) (Add (Mult (Var 5) (Var 2)) (Var 3)) 
-- Add (Mult (Var 6) (Var 3)) (Var 4)

instance Applicative Exp where
    -- pure :: a -> Exp a
    -- (<*>) :: Exp (a -> b) -> Exp a -> Exp b
    pure = Var

    (Var f) <*> e = fmap f e
    (Add f1 f2) <*> e = Add (f1 <*> e) (f2 <*> e)
    (Mult f1 f2) <*> e = Mult (f1 <*> e) (f2 <*> e)
    (Val n) <*> _ = Val n