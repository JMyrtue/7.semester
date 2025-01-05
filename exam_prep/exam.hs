-- Jonathan Myrtue Jensen
-- jojens15@student.aau.dk
-- 2015XXXX


-- Problem 1.1

-- rotate :: [a] -> [a]
rotate []     = []      -- From the proposed solution the empty list case was forgotten. 
rotate (x:xs) = xs ++ [x]

-- The function is parametric polymorphic as the input may be of any type. It is not ad hoc polymorphic, as it is not under any type class constaints.


-- Problem 1.2

allrotates xs = take (length xs) (rotated xs)
    where 
        rotated xs = xs : allrotates (rotate xs)

-- The correct solution would also be


-- Problem 1.3

-- allrotates' xs = foldr (\x (h:t) -> (rotate h) : (h:t)) [xs] (tail xs) 
allrotates' xs = map (\n -> iterate rotate xs !! n) [0..(length xs - 1)]
-- Iterate applites the function to an infinite list, with the following element being the result of its precdecessor.

-- Problem 2.1

data Tree a = Leaf a | Lnode a (Tree a) (Tree a) | Unode (Tree a) (Tree a)
    deriving Show

t1 = Unode (Unode (Leaf 17) (Leaf 484000)) (Leaf 1964)
t2 = Lnode "bingo" (Leaf "plip") (Lnode "plop" (Leaf "uhu") (Leaf "fedtmule"))


-- Problem 2.2

isfull :: Tree a -> Bool
isfull (Leaf  _)     = True
isfull (Unode _ _)   = False
isfull (Lnode _ l r) = isfull l && isfull r


-- Problem 2.3

preorder :: Tree a -> Maybe [a]
preorder (Leaf  x)     = Just [x]
preorder (Unode _ _)   = Nothing
preorder (Lnode x l r) = do ls <- preorder l
                            rs <- preorder r
                            return (x : ls ++ rs)


-- Problem 3.1

remove xs ys = [y | y <- ys, all (y /=) xs]


-- Problem 3.2

remove' _  []                     = []
remove' xs (y:ys) | all (y /=) xs = y : remove' xs ys
                  | otherwise     = remove' xs ys


-- Problem 4.1

newtype WrapString a = WS (a, String)
    deriving Show

instance Functor WrapString where
    fmap f (WS(x,s)) = WS (f x,s)

instance Applicative WrapString where
    pure x = WS(x,"horse")

    WS(g,s) <*> WS(x,s') = WS(g x,s)


-- Problem 4.2

instance Monad WrapString where
    return = pure     -- Dit not declare the return - should do so.
    WS(x,s) >>= f = f x


-- Problem 4.3

pairup mx my = do x <- mx
                  y <- my
                  return (x, y)


-- Problem 5.1

case1 x y z = if x > y then (x,y) else (x, y + z)
-- The function is ad hoc polymorhic, as the type varaible of all inputs are constained by the type classes "Ord" and "Num".


-- Problem 5.2

case2 = [(5, (\_ -> 'c'))]
-- The function involves polymophism of the 'p' of the type definition, which is not constrained by any type class. The other two values of the function are not polymorphic.


-- Problem 5.3

case3 f x = f x True


-- Problem 5.4

-- [1..]


-- Problem 6.1

naturals = 1 : map (+1) naturals


-- Problem 6.2


factorial 0 = 1
factorial n = n * factorial (n-1)

facs = map factorial [0..]


-- Problem 6.3

facs' = 1 : zipWith (*) [1..] facs' 