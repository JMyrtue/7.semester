concat2 :: [[a]] -> [a]
concat2 [] = []
concat2 [xs] = head xs : concat2 