maximum' :: [Int] -> Int
maximum' [] = error "Máximo de una lista vacía"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum' xs

-- Funcion and

ands :: [Bool] -> Bool
ands [] = True
ands (x:xs) = if x then ands xs else False
