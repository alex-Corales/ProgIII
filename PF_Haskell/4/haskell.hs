-- Numeros primos

--primes = filterPrime [2..1000]
--  where filterPrime (p:xs) = p : filterPrime [x | x <- xs, x `mod` p /= 0]

          
-- Parcialito 4

--listaTuplas :: [(Int, Int)] -> [(Int, Int)]
--listaTuplas l = cambiaTAc l []
--    where cambiaTAc [] a = a
--          cambiaTAc (x:xs) a = cambiaTAc xs (a ++ [swap x])


factAcum :: Int -> Int
factAcum n = factAcum' n 1
   where factAcum' 0 acum = acum
         factAcum' n acum = factAcum' (n-1) (n*acum) 


sum' :: (Num a) => [a] -> a
sum' xs = foldl (\b x -> b + x) 0 xs


su :: [Int] -> Int
su = foldl (+) 0

elem' :: Int -> [Int] -> Bool 
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

longfoldr :: [Int] -> Int
longfoldr xs = foldr(\_ n -> 1 + n) 0 xs

longfoldl :: [Int] -> Int
longfoldl xs = foldl(\_ n -> (1 + n)-1) 0 xs

funcionP :: Eq a => a -> [a] -> [a]
funcionP n [] = [] 
funcionP n (x:xs) = if x == n then funcionP n xs else [x] ++ funcionP n xs  

funcionR :: Eq a => a -> [a] -> [a]
funcionR n = foldr (\x xs -> if n == x then xs else [x] ++ xs) []

funcionPAcum :: Eq a => a -> [a] -> [a]
funcionPAcum n ys = funcionP_aux n ys []
      where funcionP_aux n [] acc = acc
            funcionP_aux n (x:xs) acc = if n == x then funcionP_aux n xs acc 
                                        else funcionP_aux n xs (acc ++ [x])

sumaTodo :: Num a => [(a,a)] -> a 
sumaTodo [] = 0
sumaTodo (x:xs) = (fst x + snd x) + sumaTodo xs

sumaTodoAcu :: Num a => [(a,a)] -> a 
sumaTodoAcu ys = sumaTodoAcu_aux ys 0
      where sumaTodoAcu_aux [] acc = acc
            sumaTodoAcu_aux (x:xs) acc = sumaTodoAcu_aux xs (acc + (fst x + snd x))

sumaTodoFl :: Num a => [(a,a)] -> a 
sumaTodoFl = foldr (\x xs -> )