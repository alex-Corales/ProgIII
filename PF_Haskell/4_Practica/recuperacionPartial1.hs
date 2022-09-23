primero :: (a, b) -> a
primero (x,_) = x

segundo :: (a, b) -> b
segundo (_,y) = y

funcion1 :: Eq a => a -> b -> [(a,b)] -> [(a,b)]
funcion1 x z [] = []
funcion1 x z (y:ys) = if (x == primero y) then (z, segundo y) : funcion1 x z ys else funcion1 x z ys