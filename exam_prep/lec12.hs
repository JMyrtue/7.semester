import Parsing

data Onion = Core Int | Layer Onion
    deriving Show

-- theonion :: Parser Onion
theonion = do char 'L'
              rest <- theonion
              return (Layer rest)
           <|> do n <- int
                  return (Core n)


ab = do char 'a'
        mid <- ab
        char 'b'
        return ('a' : mid ++ "b")
     <|> return ""
        
data Bexp = Or Bexp Bexp | And Bexp Bexp | Bexp
          | Neg Bexp
          | TT | FF | Paren Bexp
    deriving Show

boolexp = do
    x <- ter
    symbol "&"
    y <- boolexp
    return (And x y)
    <|> do
        x <- ter
        symbol "|"
        y <- boolexp
        return (Or x y)
    <|> do
        x <- ter
        return x

ter = do
    symbol "!"
    x <- atom
    return (Neg x)
    <|> do
        x <- atom
        return x

atom = do
    symbol "t"
    return TT
    <|> do
        symbol "f"
        return FF
    <|> do
        symbol "("
        x <- boolexp
        symbol ")"
        return (Paren x)