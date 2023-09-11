-- indica cuantos elementos tiene una lista

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

test :: [Integer] -> [Integer]
test (x:xs) = xs

