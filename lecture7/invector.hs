class InVector a where
    (&&&) :: a -> a -> a
    (***) :: a -> a -> Int

instance InVector Bool where
    True &&& _ = True
    False &&& True = True
    False &&& False = False 
    True *** True = 1
    _ *** _ = 0
