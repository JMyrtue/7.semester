rle :: Eq a => [a] -> [(a, Int)]
rle [] = []
rle (x:xs) =
  (x, length count) : rest'
  where (count, rest) = span (== x) xs
        rest' = rle rest

-- span takes a predicate and a list, and returns all elements matching from the start of the head, 
-- until the predicate turns false. Then it returns the list split in two.