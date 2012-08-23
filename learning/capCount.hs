import Data.Char
--capCount :: String -> Int
capCount = length . filter(isUpper . head) . words    
capWords = filter(isUpper . head) . words          
squareArea :: [String] -> [String]
squareArea xs = xs ++ xs