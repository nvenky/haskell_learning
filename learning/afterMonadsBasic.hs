data Term = Con Int |Div Term Term
type M a = a

eval :: Term -> M Int 
eval (Con a) = unit a 
eval (Div t u) = eval t (\a -> (eval u (\b -> unit (a `div` b))))

unit :: a -> I a 
unit a = a
(*) :: M a -> (a -> M b) ->  M b
a * k = k a