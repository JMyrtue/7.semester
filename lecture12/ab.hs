import Parsing

ab :: Parser String
ab = do
    char 'a'
    mid <- ab
    char 'b'
    return ('a' : mid ++ "b")
    <|> return ""