import Data.Char
factorial n = product [1..n]

average xs = sum xs `div` length xs

quickSort []=[]
quickSort (x:xs) = quickSort(filter(<x) xs) ++ [x] ++ quickSort(filter(>=x) xs)  

-- Method composition
capCount = length . filter(isUpper . head) . words

--Type Inference
--squareArea :: [String] -> [String]
squareArea x = x + x

myConcat xs = xs ++ xs

twice f x =f (f x)
square a= a * a
quad= twice square

-- Currying 
add (x,y) = x + y
add' x y = x + y

currencyConvertor exchRate amount = exchRate * amount
usdConv = currencyConvertor 45.5
audConv = currencyConvertor 40.5 


-- *******FUNCTIONS************
-- conditional exp 
-- Should always have else block
abs n = if n>=0 then n else -n

--with guards
abs' n | n>=0 = n | otherwise = -n 

-- Pattern Matching with Laziness
pat :: Bool -> Bool -> Bool
pat True b = b
pat False _ = False
-- pat ('a'=='b') (head [] == 24)
-- pat ('a'=='a') (product [1,2,3,4] == 24)

myHead (x:_) = x

-- Lambda Expressions


-- List comprehension
factors n = [x | x <-[1..n], n `mod` x == 0]

-- qSort::(Num a,Ord a)=>[a]->[a]
qSort [] =[]
qSort (x:xs) = qSort smaller ++ [x] ++ qSort bigger
               where smaller = [y | y <- xs, y<x]
                     bigger = [z | z <- xs, z >=x]


-- Function composition

myAll p xs = and [p x | x <- xs]
isAllEven = myAll even

-- Case statements
data Grade = O | A | B | C | F
grade mark 
      | mark >= 90 = O
      | mark >= 80 = A
      | mark >= 70 = B
      | mark >= 50 = C
      | otherwise = F

res f = \mark -> case f mark of
                        O -> "Excellent"
                        A -> "Great"
                        B -> "Good"
                        C -> "Must do better"
                        F -> "FAILED"

-- Types and Data
data Exp = Val Int
           | Add Exp Exp
           | Mul Exp Exp

-- 5 + (10 * 5)
s= Add (Val 5) (Mul (Val 10) (Val 5))

eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y


data Tree = Leaf Int
            | Node Tree Int Tree

occurs num (Leaf t)  = t == num
occurs num (Node l t r) = t==num || occurs num l || occurs num r   

tree = Node (Node (Leaf 5) 6 (Leaf 7)) 4 (Node (Leaf 1) 2 (Leaf 3))
