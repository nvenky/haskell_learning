data Term = Con Int 
            | Frac Term Term deriving Show

{-
------------ Simple division ------------------
eval :: Term -> Int
eval (Con a) = a
eval (Frac x y) = eval x `div` eval y

-}

--------Sample data---------
ans, err :: Term
ans = (Frac (Frac (Con 8) (Con 2 )) (Con 2))
err = (Frac (Con 1) (Con 0 ))


{-
-----------Exception without Monad ---------------
-- Maybe
-- (>>=) :: (Monad m) => m a -> (a -> m b) -> m b

data M = Exception String | Numeric Int deriving Show

eval :: Term -> M
eval (Con a) = Numeric a
eval (Frac numerator denominator) = case eval numerator of
                                     Exception e -> Exception e
                                     Numeric a -> case eval denominator of
                                                       Exception e -> Exception e
                                                       Numeric b -> if b == 0
                                                                    then Exception "div by zero"
                                                                    else Numeric (a `div` b)

-}

----------------------- Exception Monad - WITHOUT do ---------------

data M a= Exception String | Numeric a deriving Show
-- (>>=) :: (Monad m) => m a -> (a -> m b) -> m b

instance Monad M where
  return a = Numeric a
  (>>=) x y = case x of
                 Exception e -> Exception e
                 Numeric a -> y a 

eval :: Term -> M Int
eval (Con a) = return a
eval (Frac numerator denominator) = eval numerator >>= 	
                                        \a -> eval denominator >>= 
                                        \b ->  if b == 0 then Exception "divide by zero" else return (a `div` b)


{-
----------------------- Exception Monad - do ---------------
data M a= Exception String | Numeric a deriving Show

instance Monad M where
  return a = Numeric a
  (>>=) x y = case x of
                 Exception e -> Exception e
                 Numeric a -> y a 

eval :: Term -> M Int
eval (Con a) = return a
eval (Frac numerator denominator) = do 
                                   a <- eval numerator  
                                   b <- eval denominator 
                                   if b == 0 then Exception "divide by zero" else return (a `div` b)

-}