data Onion a = Core a | Layer (Onion a)
    deriving Show

instance Functor Onion where
    -- fmap :: (a - b) -> Onion a -> Onion b
    fmap g (Core x)  = Core (g x)
    fmap g (Layer x) = Layer (fmap g x)