comp f xs = map f (filter p xs)
-- switching them would be wrong:
-- filter p (map f xs) -- This would apply the function supplied to map first, and then filtering.


