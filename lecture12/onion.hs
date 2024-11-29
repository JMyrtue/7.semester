import Parsing

-- Changed core to Int instead of Integer to make solution work
data Onion = Core Int | Layer Onion 
    deriving Show

-- theonion :: Parser Onion
theonion = do 
    char 'L'
    rest <- theonion
    return (Layer rest)
    <|> do
        n <- int
        return (Core n)

-- parse theonion "LLLLL7"