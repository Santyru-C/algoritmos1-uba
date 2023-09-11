-- indica cuantos elementos tiene una lista

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- indica la suma de todos los elementos de una lista

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- indica si un elemento pertenece a una lista
test :: [Integer] -> [Integer]
test (x:xs) = xs

