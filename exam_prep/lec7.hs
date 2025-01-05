data Unary = Z | I Unary
    deriving (Show)

unary2int :: Unary -> Int
unary2int Z     = 0
unary2int (I n) = 1 + (unary2int n)
-- Testcase could be "unary2int (I (I Z))", giving "2"


-- data Tree a = Leaf a | Node (Tree a) a (Tree a)

-- -- least :: Ord a => Tree a -> a
-- least (Leaf a)                                        = a
-- least (Node l x r) | least l < x && least l < least r = least l
--                    | least r < x                      = least r
--                    | otherwise                        = x

-- Original solution from the lecture: least (Node l x r) = min (least l) (min x (least r))

data Aexp = Val Int | Var String | Add Aexp Aexp | Mult Aexp Aexp | Assign String Aexp Aexp
    deriving Show

-- key/value pair to store variables
type Assoc = [(String, Int)]

variables :: Assoc
variables = [("x", 3), ("y", 4)]

getVal :: String -> Assoc -> Int
getVal var ass = head [v | (var', v) <- ass, var == var']

updVar :: String -> Int -> Assoc -> Assoc
updVar v n []                         = [(v, n)]
updVar var n ((k,v) : xs) | k == var  = (var, n) : xs
                          | otherwise = (k,v) : updVar var n xs  

eval :: Aexp -> Assoc -> Int
eval (Val n)      ass = n
eval (Var x)      ass = getVal x ass
eval (Add x y)    ass = eval x ass + eval y ass
eval (Mult x y)   ass = eval x ass * eval y ass
eval (Assign x n exp) ass = eval exp (updVar x (eval n ass) ass)

evaltest1 = eval (Add (Val 4) (Val 2)) variables
evaltest2 = eval (Mult (Val 4) (Val 2)) variables
evaltest3 = eval (Add (Mult (Val 2) (Var "x")) (Var "y")) variables
evaltest4 = eval (Assign "x" (Val 3) (Assign "y" (Val 4) (Add (Mult (Val 2) (Var "x")) (Var "y")))) []
evaltest5 = eval (Assign "x" (Val 3) (Assign "y" (Val 4) (Add (Mult (Val 2) (Var "x")) (Var "y")))) [("x", 1)]

data Encyclopedia a = Node a [Encyclopedia a] deriving Show

t1 = Node ("mango", True) 
        [ Node ("dingo", False) 
            [ Node ("plip", True) []
            , Node ("ninka", False) []
            ]
        , Node ("plop", True) []
        , Node ("plys", False) 
            [ Node ("boing", True) []]
        ]

t2 = Node ("plonk", 1) 
        [ Node ("zap", 3) 
            [ Node ("ninka", 8) []]
        , Node ("uhu", 3) 
            [ Node ("gif", 8) []]
        , Node ("bingo", 5) []
        ]

class InVector a where
    (&&&) :: a -> a -> a
    (***) :: a -> a -> Int

instance InVector Bool where
    True &&& True = True
    _    &&& _    = False

    True *** True = 1
    _    *** _    = 0