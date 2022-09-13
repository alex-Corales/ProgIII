module Programacion where

-- Ejercicio 4

-- punto 1

longitud :: [Int] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

longitudAcum :: [a] -> Int
longitudAcum ys = longitudAcum_aux ys 0
      where longitudAcum_aux [] acc = acc
            longitudAcum_aux (_:xs) acc = longitudAcum_aux xs (acc + 1) 

longitudFoldr :: [a] -> Int
longitudFoldr xs = foldr (\_ n -> 1 + n) 0 xs



-- punto 2

contador :: [Int] -> Int -> Int
contador [] a = 0
contador (x:xs) a = if x == a then contador xs a + 1 else contador xs a 
      

contadorAcum :: Eq a => [a] -> a -> Int
contadorAcum ys n = contadorAcum_aux ys n 0
      where contadorAcum_aux [] n acum = acum
            contadorAcum_aux (x:xs) n acum = if x == n 
                                             then contadorAcum_aux xs n (acum + 1) 
                                             else contadorAcum_aux xs n acum

--  punto 3

buscar :: [Int] -> Int -> Bool
buscar (x:xs) a = if x == a then True else buscar xs a    
buscar [] a = False 

buscarAcum :: Eq a => [a] -> a -> Bool
buscarAcum ys a = buscarAcum_aux ys a True
      where buscarAcum_aux [] a acc = False
            buscarAcum_aux (x:xs) a acc = if x == a then acc else buscarAcum_aux xs a acc

-- punto 4

cont :: [[Int]] -> [Int]
cont [] = []
cont (x:xs) = x ++ cont xs 

contRever :: [[Int]] -> [Int]
contRever [] = []
contRever (x:xs) = x ++ cont(reverListas xs)

-- punto 5

masLarga :: [Int] -> [Int] -> Int
masLarga [] [] = 0
masLarga (x:xs) (y:ys) = if longitud (x:xs) > longitud (y:ys) then 1 
                         else if longitud (x:xs) == longitud (y:ys) then 3 else 2

-- punto 6

producto :: [Int] -> Int
producto [] = 1
producto (x:xs) = x * producto xs

-- punto 7 

sumaSucesivas :: [Int] -> Int
sumaSucesivas [] = 0
sumaSucesivas (x:xs) = x + sumaSucesivas xs

sumaSucesivass :: [Int] -> Int
sumaSucesivass ys = sumaSucesivass_aux ys 0
      where sumaSucesivass_aux [] acc = acc
            sumaSucesivass_aux (x:xs) acc = acc + (x + sumaSucesivass_aux xs acc)

-- punto 8

revers :: [Int] -> [Int]
revers [] = []
revers (x:xs) = revers xs ++ [x]

-- punto 9

reverListas :: [[Int]] -> [[Int]]
reverListas [] = []
reverListas (x:xs) = revers x : reverListas xs


-- Ejercicio 5

-- Punto 5.2

-- dobleLongitud :: [1,2,3] -> [1,2,3,1,2,3]
dobleLongitud :: [Int] -> [Int]
dobleLongitud [] = []
dobleLongitud (x:xs) = (x:xs) ++ (x:xs)

-- dobleLongitud1 :: [1,2,3] -> [1,2,3,3,2,1]
dobleLongitud1 :: [Int] -> [Int]
dobleLongitud1 [] = []
dobleLongitud1 (x:xs) = (x:xs) ++ revers(x:xs)

{- Alternativa a la solucion
    dobleLongitud1 :: [Int] -> [Int]
    dobleLongitud1 [] = []
    dobleLongitud1 (x:xs) = [x] ++ dobleLongitud1 xs ++ [x]
-}

-- dobleLongitud2 :: [1,2,3] -> [1,1,2,2,3,3]
dobleLongitud2 :: [Int] -> [Int]
dobleLongitud2 [] = []
dobleLongitud2 (x:xs) = [x] ++ [x] ++ dobleLongitud2 xs

-- Punto 5.3

primerosPares :: Int -> [Int]
primerosPares n = [x*2 | x <- [1..n]]

-- Punto 5.4

-- multiplos :: 2 -> 4 -> [2,4,6,8]
multiplos :: Int -> Int -> [Int]
multiplos y n = [x*y | x <- [1..n]]

-- Ejercicio 7

{-
    foldl -> type: (a -> b -> a) -> a -> [b] -> a 
          -> Descripcion: Toma el segundo argumento y el primer elemento de la lista 
          y les aplica la funcion, luego alimenta la funcion con este resultado y el segundo
          argumento y asi sucesivamente. 

    foldr -> type: (a -> b -> b) -> b -> [a] -> b
          -> Descripcion: Toma el segundo argumento y el ultimo elemento de la lista
          y aplica la funcion, luego toma el penultimo elemento del final y el resultado, y asi
          sucesivamente.

    foldl1 -> type: (a -> a -> a) -> [a] -> a
           -> Descripcion: toma los primeros 2 elementos de la lista y les aplica la función, 
           luego alimenta la función con este resultado y el tercer argumento y así sucesivamente.

    foldr1 -> type: (a -> a -> a) -> [a] -> a
           -> Descripcion: toma los dos últimos elementos de la lista y aplica la función,
            luego toma el tercer elemento del final y el resultado, y así sucesivamente.


-}
    
reverses :: [a] -> [a]
reverses = foldr (\x xs -> xs ++ [x]) []


-- Punto 7.1

lengthFoldr :: [Int] -> Int
lengthFoldr xs = foldr(\_ n -> 1 + n) 0 xs

lengthFoldl :: [Int] -> Int
lengthFoldl xs = foldl(\_ n -> (1 + n)-1) 0 xs

-- Punto 7.2

contadorFoldl :: [Int] -> Int -> Int
contadorFoldl ys y = foldl (\acc x -> if x == y then (acc + 1) else (acc + 0)) 0 ys

-- Punto 7.3 (BUSCAR COMO FUNCIONA)

buscarElemento :: Int -> [Int] -> Bool
buscarElemento y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- Punto 7.4

concatenarLista :: [Int] -> [Int]
concatenarLista = foldr(\x xs -> [x] ++ xs ++ [x]) []

-- Punto 7.6

productoListas :: [Int] -> Int
productoListas (x:xs) = foldl1 (*) (x:xs) 


-- Punto 7.8

reversList :: [Int] -> [Int]
reversList = foldl (\x xs -> xs : x) [] 

-- Punto 7.9

--listaListas :: [[Int]] -> [[Int]]
--listaListas = foldl (\x xs -> reversList x : xs) [[]]