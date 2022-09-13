dobleLongitud1 :: [Int] -> [Int]
dobleLongitud1 [] = []
dobleLongitud1 (x:xs) = [x] ++ dobleLongitud1 xs ++ [x]

listaDe :: Int -> Gen a -> Gen [a]
listaDe n g = sequence [ g | i <- [1..n] ]


-- Token github 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
