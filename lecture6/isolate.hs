-- isolate :: (a -> Bool) -> [a] -> ([a], [a])
isolate p xs = (filter p xs, filter (not . p) xs)

isolate' p xs = foldr (\x (m, nm) -> if p x then (x : m, nm) else (m, x : nm)) ([],[]) xs