readValDo = do 
            x <- getChar
            getChar
            y <- getChar
            return (x,y)


readValBind = 
              getChar >>= \x 
              -> getChar >>= \_ 
              -> getChar >>= \y 
              -> return (x,y)


--double xs = do
--              sout xs 
--              return map (*2) xs

sout [] = return ()
sout (x:xs) = do 
               putStrLn x
               sout xs
            
-- cvt str = let s <- sstr str
       
sstr str = do 
            putStrLn str
            return str

