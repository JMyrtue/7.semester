--quango :: a -> [a]
quango n = [n]
-- Parametric polymoprhism, because there are no constraints on the type variables.

--tango :: Num p1 => (a,b) -> p2 -> p1
tango (x,y) n = 9
-- Both ad-hac and parametric polymorphism. Ad hoc because of the return value, and parametric, due to the arguments.

mango x y z = x * y + z - 42