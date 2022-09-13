import Data.Tuple (swap)

-- [1,2,3,4,5,6] -> [[1,2],[3,4],[5,6]]

puntoUno :: Int -> [Int] -> [[Int]]
puntoUno n [] = []
puntoUno n xs = take n xs : puntoUno n (drop n xs) 

{-
    take lo que hace es tomar los n primeros elementos de la lista.
    drop lo que hace es eliminar por asi decirle los n primeros elementos de la lista.
-}

numerosImpares :: Int -> Bool
numerosImpares 0 = True
numerosImpares x = if mod (mod x 10) 2 /= 0 then numerosImpares (x`div`10) else False


mitadLista :: [Int] -> ([Int], [Int]) 
mitadLista xs = (take mitad xs, drop mitad xs) 
    where mitad = (length xs) `div` 2

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n - 1)

factorialF :: Int -> Int
factorialF n = foldr (*) 1 [1..n]

igualLista :: Eq a => [a] -> [a] -> Bool
igualLista [] [] = True
igualLista (x:xs) (y:ys) = if x == y then igualLista xs ys else False
igualLista _ _ = False

conc :: [Int] -> [Int] -> [Int]
conc (x:xs) (y:ys) = (x:xs) ++ (y:ys) 

concRecur :: [Int] -> [Int] -> [Int]
concRecur [] [] = []
concRecur (x:xs) (y:ys) = [x] ++ [y] ++ concRecur xs ys 

concats :: [[a]] -> [a]
concats [] = []
concats (x:xs) = x ++ concats xs

concats1 :: [[a]] -> [a]
concats1 = foldr (++) [] 

ultElem :: [a] -> a
ultElem [x] = x
ultElem (x:xs) = ultElem xs

ultElem1 :: [a] -> a
ultElem1 = foldr1 (\x y -> y)

inits :: [a] -> [a]
inits [x] = []
inits (x:xs) = x : inits xs

factoriales :: Integer -> [Integer]
factoriales n = reverse (aux (n+1) 0 [1])
    where aux n m (x:xs) = if n==m then xs else aux n (m+1) (((m+1)*x):x:xs)


n_reverse_2 :: [a] -> [a]
n_reverse_2 xs = n_reverse_2_aux xs []
    where n_reverse_2_aux [] ys = ys
          n_reverse_2_aux (x:xs) ys = n_reverse_2_aux xs (x:ys)


cambiaT  :: [(Int, Int)] -> [(Int, Int)]
cambiaT l = cambiaTAc l []
    where cambiaTAc [] a = a
          cambiaTAc (x:xs) a = cambiaTAc xs (a ++ [swap x])

cambiaTs :: [(Int, Int)] -> [(Int, Int)]
cambiaTs [] = []
cambiaTs (x:xs) = swap x : xs

cambiaL :: [Int] -> [Int]
cambiaL css = cambiaLac css []
    where cambiaLac (x:xs) a = cambiaLac xs (a ++ [x])


sumaLisTu :: [(Int,Int)] -> Int
sumaLisTu [] = 0
sumaLisTu (x:xs) = (fst x + snd x) + sumaLisTu xs 

--sumaLisTuA :: [(Int,Int)] -> Int
--sumaLisTuA ys = sumaLisTuA_aux ys acc
--    where sumaLisTuA_aux [] acc = 0
--          sumaLisTuA_aux (x:xs) acc = acc + ((fst x + snd x) + sumaLisTuA_aux xs) 





