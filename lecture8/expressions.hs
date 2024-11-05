temp x y bs = if x + 1 > y && head (head  bs) == True 
                  then True 
                  else False


anden (func, x) y = func (x) + y  

tredje f g h x = h ((f x + g x) / 2)