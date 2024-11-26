data Tree a = Leaf a | Node (Tree a) (Tree a)

-- minmax :: Monad a Ord a => Tree -> (a, a)
-- minmax (Leaf x) = Just (x, x)
-- minmax (Node l r) = 

--Solution from lecturer

-- minmax :: Tree a -> Maybe (a, a)
minmax (Leaf x) = Just (x, x)
minmax (Node l r) = do
                        (x1, y1) <- minmax l
                        (x2, y2) <- minmax r
                        if y1 <= x2 then return (x1, y2)
                        else Nothing

minorder t = do
                (x, y) <- minmax t
                return x

mytree1 = Node (Node (Leaf 1) (Leaf 2)) (Leaf 2)
mytree2 = Node (Node (Leaf 3) (Leaf 2)) (Leaf 1)
