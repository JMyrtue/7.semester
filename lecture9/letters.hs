letters = do
    w <- getLine
    prWord w

prWord [] = putChar ' '
prWord (x:xs) = do
    putChar x 
    putChar '\n' 
    prWord xs 

