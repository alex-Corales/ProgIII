-- Punto 6

concatenar :: [Int] -> [Int]
concatenar [] = []
concatenar (x:xs) = [x] ++ [x] ++ concatenar xs 

concatenarFoldl :: [Int] -> [Int]
concatenarFoldl [] = []
concatenarFoldl (x:xs) = [x] ++ foldl (++) [x] [(concatenarFoldl xs)]

concatenarFoldr :: [Int] -> [Int]
concatenarFoldr [] = []
concatenarFoldr (x:xs) = foldr (++) [x] [(concatenarFoldr xs)] ++ [x]

-- punto 5
longitud :: [Int] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

masLarga :: [Int] -> [Int] -> Int
masLarga [] [] = 0
masLarga (x:xs) (y:ys) = if longitud (x:xs) > longitud (y:ys) then 1 
                         else if longitud (x:xs) == longitud (y:ys) then 3 else 2

masLargaFoldl :: [int] -> [Int] -> Int
masLargaFoldl [] [] = 0
masLargaFoldl (x:xs) (y:ys) = if length (x:xs) > length (y:ys) then 1
