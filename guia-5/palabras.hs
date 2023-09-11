-- indica cuantos elementos tiene una lista

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- indica la suma de todos los elementos de una lista

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- indica si un elemento pertenece a una lista
pertenece :: Integer -> [Integer] -> Bool
pertenece x [] = False
pertenece x (y:ys)
    | x == y = True
    | otherwise = pertenece x ys

test :: [Integer] -> [Integer]
test (x:xs) = xs

