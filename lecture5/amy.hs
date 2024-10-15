amy :: (a -> Bool) -> [a] -> Bool
amy _ [] = False
amy p (x:xs) = p x || amy p xs

-- the function only finds if ONE occurance matches the predicate.
-- If it reaches the end of the list it encounters a False, and would have False for all elements, thus returning False.
    -- Otherwise, if a single element is encountered that evaluates to True, it will due so, due to lazt evaluation.
-- To modify the function to apply a predicate, and determine if ALL elements satisfy it, 
-- the base case would change to True, and the '||' should change to '&&'.