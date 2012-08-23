data Term = Con Int | Div Term Term
data M a	= Raise Exception | Return a 
type Exception = String
eval :: Term -> M Int 
eval (Con a) x = (a,x) 
eval (Div t u) x = let (a,y) = eval t x in
                    let (b,z) = eval u y in 
						(a + b,z +1)