-- This is the simple program from the slides from the introduction

laengde :: (Num p) => [a] -> p

laengde [] = 0
laengde (x:l) = 1 + (laengde l)

myList = [2,3,17,9,69,484000]

data BTree = BLeaf Int | BBranch Int BTree BTree deriving Show

-- sumtree :: BTree -> Int

sumtree (BLeaf x) = x
sumtree (BBranch x t1 t2) = let v1 = sumtree t1
                                v2 = sumtree t2
                            in x + v1 + v2


myBigOak = BBranch 14 (BLeaf 13) (BLeaf 17)

-- Quicksort

qsort :: (Ord a) => [a] -> [a]

qsort [] = []
qsort (x:xs) = big ++ [x] ++ small
                 where small = qsort [a | a <- xs, a < x]
                       big   = qsort [a | a <- xs, a > x]

second xs = head(tail(xs))


allbutsecond (x:y:rest) = x : rest 
allbutsecond' xs = head xs : drop 2 xs