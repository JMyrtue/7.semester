module Isolate (isolate) where

isolate :: Eq a => [a] -> a -> ([a], [a])
isolate [] _     = ([], [])
isolate (x:xs) y = if x == y then (l1, x : l2)
                   else (x : l1, l2)
                   where (l1,l2) = isolate xs y

                