data Nat = Zero | Succ Nat

add x y = x + y

mult :: Nat -> Nat -> Nat
mult Zero m     = Zero
mult (Succ n) m = add (mult n m) m

-- The video declares that we have defined add during the lecture part of the video, but that was for Expr, but not for Nat.
