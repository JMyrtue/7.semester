import Parsing

data Bexp = Or Bexp Bexp | And Bexp Bexp | T Bexp
          | Neg Bexp | Norm Bexp
          | TT Bool | FF Bool | Paren Bexp
    deriving Show

boolexp = do
    x <- ter
    char '&'
    y <- boolexp
    return (And x y)
    <|> do
        x <- ter
        char '|'
        y <- boolexp
        return (Or x y)
    <|> do
        x <- ter
        return (T x)

ter = do
    char '!'
    x <- atom
    return (Neg x)
    <|> do
        x <- atom
        return (Norm x) 

atom = do
    char 't'
    return (TT True)
    <|> do
        char 'f'
        return (FF False)
    <|> do
        char '('
        x <- boolexp
        char ')'
        return (Paren x)

