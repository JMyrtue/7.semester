data Aexp = Val Int
          | Var String
          | Add Aexp Aexp
          | Mult Aexp Aexp
            deriving Show

insert :: [(String, Int)] -> (String, Int) ->[(String, Int)] 

ass :: String -> Int -> (Aexp, Aexp)
ass v n = (Var v, Val n)

eval :: Aexp -> Aexp
eval (Val x) = x
eval (Var x) = 
eval (Add x y) = (eval x) + (eval y)
eval (Mult x y) = (eval x) * (eval y)

-- Solution from other students:

-- data Aexp = Val Int | Var String | Assign String Int Aexp | Add Aexp Aexp | Mul Aexp Aexp
--     deriving(Show)

-- -- key/value pair to store variables
-- type Assoc = [(String, Int)]

-- variables :: Assoc
-- variables = [("x", 3), ("y", 4)]

-- -- function to get a value
-- getVariableValue :: String -> Assoc -> Int
-- getVariableValue _ [] = 0
-- getVariableValue var ass = head [v | (var', v) <- ass, var == var']

-- updateVariable :: String -> Int -> Assoc -> Assoc
-- updateVariable var val [] = [(var, val)]
-- updateVariable var val ((k, v) : xs)
--     | k == var  = (var, val) : xs
--     | otherwise = (k,v) : updateVariable var val xs


-- eval :: Aexp -> Assoc -> Int
-- eval (Val n) _                = n
-- eval (Var x) ass              = getVariableValue x ass
-- eval (Assign var val exp) ass = eval exp (updateVariable var val ass)
-- eval (Add x y) ass            = eval x ass + eval y ass
-- eval (Mul x y) ass            = eval x ass * eval y ass


-- evaltest1 = eval (Add (Val 4) (Val 2)) variables
-- evaltest2 = eval (Mul (Val 4) (Val 2)) variables
-- evaltest3 = eval (Add (Mul (Val 2) (Var "x")) (Var "y")) variables
-- evaltest4 = eval (Assign "x" 3 (Assign "y" 4 (Add (Mul (Val 2) (Var "x")) (Var "y")))) []
-- evaltest5 = eval (Assign "x" 3 (Assign "y" 4 (Add (Mul (Val 2) (Var "x")) (Var "y")))) [("x", 1)]

-- Another:
-- data Aexp n x = Numeral n | Variable x | Add (Aexp n x) (Aexp n x) | Mul (Aexp n x) (Aexp n x)
-- type Assignmen n x = x -> n

-- eval :: (Num n) => Assignmen n x -> Aexp n x -> n
-- eval assignment (Numeral n) = n
-- eval assignment (Variable x) = assignment x
-- eval assignment (Add e1 e2) = eval assignment e1 + eval assignment e2
-- eval assignment (Mul e1 e2) = eval assignment e1 * eval assignment e2


-- test = eval assingment (Add (Mul (Numeral 2) (Variable "x")) (Variable "y"))
--     where 
--         assingment "x" = 3
--         assingment "y" = 4

-- fun = eval (sum . map fromEnum) (Mul (Variable "A") (Add (Numeral 2) (Numeral 2)))

