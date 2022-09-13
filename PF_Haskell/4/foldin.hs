-- Notas 

-- foldl

--(a -> b -> a) -> a -> [b] -> a
--toma el segundo argumento y el primer elemento de la lista y les aplica la función, 
--luego alimenta la función con este resultado y el segundo argumento y así sucesivamente.


-- Explicacion del Fold !!

-- Suma

suma:: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs

-- Suma con foldl
sumaF :: [Int] -> Int
sumaF [] = 0
sumaF (x:xs) = (+) x (suma xs)



