-- Ejercicio 1

primero :: Num a => (a, a) -> a
primero (x,_) = x

segundo :: Num a => (a, a) -> a
segundo (_,y) = y

sumaTodoRecursion :: Num a => [(a,a)] -> a
sumaTodoRecursion [] = 0
sumaTodoRecursion (x:xs) = (primero x + segundo x) + sumaTodoRecursion xs

sumaTodoRecursionCola :: Num a => [(a,a)] -> a
sumaTodoRecursionCola ys = sumaTodoRecursionCola_aux ys 0
    where sumaTodoRecursionCola_aux [] acc = acc
          sumaTodoRecursionCola_aux (x:xs) acc = sumaTodoRecursionCola_aux xs ((primero x + segundo x)+acc)   

sumaTodoRecursionFoldr :: Num a => [(a,a)] -> a
sumaTodoRecursionFoldr ys = foldr(\x acc -> (primero x + segundo x) + acc) 0 ys

sumaTodoRecursionFoldl :: Num a => [(a,a)] -> a
sumaTodoRecursionFoldl ys = foldl(\acc x -> acc + (primero x + segundo x)) 0 ys


-- Ejercicio 2

elimEl :: Eq a => a -> [a] -> [a]
elimEl _ [] = []
elimEl n (x:xs) = if x == n then elimEl n xs else x : elimEl n xs

elimElAcumulador :: Eq a => a -> [a] -> [a]
elimElAcumulador n ys = elimElAcumulador_aux n ys []
    where elimElAcumulador_aux _ [] acc = acc
          elimElAcumulador_aux ns (x:xs) acc = if x == n 
                                              then elimElAcumulador_aux ns xs acc
                                              else elimElAcumulador_aux ns xs (acc++[x])

elimElFolfr :: Eq a => a -> [a] -> [a]
elimElFolfr n = foldr (\x xs -> if n == x then xs else [x] ++ xs) []

elimElFolfl :: Eq a => a -> [a] -> [a]
elimElFolfl n ys = foldl (\acc x -> if n == x then acc else acc ++ [x]) [] ys



fun :: [(a,b)] -> ([a],[b])
fun lis = foldl (aux) ([],[]) lis
    where aux (a,b) (x,y) = (a ++ [x], b ++ [y])


