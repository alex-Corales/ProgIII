-- Listas
{-
head :: [a] -> a
    O (1) . Extraiga el primer elemento de una lista, que no debe estar vacío.

last :: [a] -> a
    O (n). Extrae el último elemento de una lista, que debe ser finito y no vacío.

tail :: [a] -> [a]
    O (1). Extraiga los elementos después del encabezado de una lista, que no debe estar vacía.

init :: [a] -> [a]
    O (n). Devuelve todos los elementos de una lista excepto el último. La lista no debe estar vacía.

null :: Foldable t => t a -> Bool
    Prueba si la estructura está vacía. La implementación predeterminada está 
    optimizada para estructuras que son similares a las listas de contras, porque no hay 
    una forma general de hacerlo mejor.

length :: Foldable t => t a -> Int
    Devuelve el tamaño/longitud de una estructura finita como un archivo Int. 
    La implementación predeterminada está optimizada para estructuras que son 
    similares a las listas de contras, porque no hay una forma general de hacerlo mejor.

reverse :: [a] -> [a]
    reverse xs devuelve los elementos de xs en orden inverso. xs debe ser finito.

take :: Int -> [a] -> [a]
    take n, aplicado a una lista xs, devuelve el prefijo de xs de longitud n, 
    o xs sí mismo si n > length xs

    take 5 "Hello World!" == "Hello"
    take 3 [1,2,3,4,5] == [1,2,3]
    take 3 [1,2] == [1,2]
    take 3 [] == []
    take (-1) [1,2] == []
    take 0 [1,2] == []
    
    Es una instancia de las más generales genericTake, en las que npuede 
    ser de cualquier tipo integral.
    
drop :: Int -> [a] -> [a]
    drop n xsdevuelve el sufijo de xs después de los primeros nelementos, 
    o []si :n > length xs

    drop 6 "Hello World!" == "World!"
    drop 3 [1,2,3,4,5] == [4,5]
    drop 3 [1,2] == []
    drop 3 [] == []
    drop (-1) [1,2] == [1,2]
    drop 0 [1,2] == [1,2]

    Es una instancia de las más generales genericDrop, en las que npuede 
    ser de cualquier tipo integral.


maximum :: forall a. (Foldable t, Ord a) => t a -> a
    El elemento más grande de una estructura no vacía.

minimum :: forall a. (Foldable t, Ord a) => t a -> a
    El elemento mínimo de una estructura no vacía.

sum :: (Foldable t, Num a) => t a -> a
    La sumfunción calcula la suma de los números de una estructura.

concat:
product: 
elem: 
replicate:
: , ++, !!: 
-}