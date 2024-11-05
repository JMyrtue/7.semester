filterfold :: (a -> Bool) -> [a] -> [a]
filterfold p xs = foldr (\x acc -> if p x then x : acc else acc) [] xs