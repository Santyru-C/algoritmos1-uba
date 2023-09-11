--- 1
-- a

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- b
ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

-- c
principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x:(principio xs)