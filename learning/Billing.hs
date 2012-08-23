type Amount =Double
data BillingInvoice = CreditCard String Integer String
					| Cash Amount
					| Coupon [String]
					deriving (Show)