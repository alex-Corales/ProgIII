buscar :: Eq a => [a] -> a -> Bool
buscar (x:xs) a = if a == x then True else buscar xs a
buscar [] a = False
