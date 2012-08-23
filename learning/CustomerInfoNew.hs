data CustomerInfoNew = CustomerNew {
						customerId :: Int,
						customerName :: String,
						address :: [String] 
					} deriving (Show)

data CustomerInfo = Customer {
											customerId :: Int,
											customerName :: String,
											address :: [String] 
										} deriving (Show)					
					