myDrop n xs = if n<=0 || null xs
			  then 	return xs
			  else myDrop (n-1) (tail xs)
			--deriving (Show)
			 	