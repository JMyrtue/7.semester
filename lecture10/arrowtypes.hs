import qualified Prelude
import Prelude hiding (Applicative)

instance Applicative [] where
    pure x = [x]
    [] <*> _  = []
    gs <*> [] = []
    (g:gs) <*> xs = (fmap g xs) ++ gs <*> xs


-- There are above are what is explained on the lecture for Problem 3, it does not compile, but expect it to be due to not hiding something correctly.