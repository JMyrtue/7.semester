data Tree a = Leaf a | Node (Tree a) a (Tree a)

least :: Ord a => Tree a -> a
least (Leaf x)     =  x
least (Node l x r) = min (least l) (min x (least r))