(||) :: Bool a => a -> a -> a
True  || True  = True
True  || False = True
False || True  = True
False || False = False



False || False = False
_     || _     = True


False || b = b 
True  || _ = True



--Redefine AND
--first version
(&&) a b = if a == True then if b == True then True else False else False