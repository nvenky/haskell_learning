type ISBN = Int
type Title = String
type Authors =[String] 
--type authors =[String] 
type CustomerId =Int
--data BookInfo= BookInfo Int String [String]
--                deriving (Show)

data BookInfo= Book ISBN Title Authors
 deriving (Show)
data BookReview = BookReview BookInfo CustomerId
                deriving (Show)

