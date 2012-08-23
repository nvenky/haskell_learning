data Term = Con Int |Div Term Term
data M a = Raise Exception | Return a 
type Exception = String

eval :: Term -> M Int 
eval (Con a) = Return a 
eval(Div t u) = case eval t of 
				Raise e -> Raise e 
				Return a -> case eval u	of 
							Raise e -> Raise e 
							Return b -> 
								if b==0 then 
								Raise "divide by zero" 
								else
								Return (a `div` b)