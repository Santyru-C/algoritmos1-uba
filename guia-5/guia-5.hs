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

-- d
reverso :: [t] -> [t]
reverso (x:[]) = [x]
reverso (x:xs) = reverso(xs)++[x] -- using ++ as the function returns a list as a requirement