Maybe a = Just a
		| Nothing

mySecond :: [a] -> a

mySecond (xs) = if null (tail(xs))
				  then error "list is too short"
				  else head(tail(xs))
				 
safeSecond :: [a] -> MayBe a				
safeSecond []=Nothing
safeSecond xs = if (null (tail(xs)))
				then Nothing
				else head(tail xs)