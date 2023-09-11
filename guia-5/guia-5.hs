--- 1
-- a -devuelve la cantidad de elementos de una lista de elementos tipo t
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- b -devuelve el ultimo elementos de una lista de elementos tipo t
ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

-- c -devuelve una sublista que contiene todos los elementos de la lista original exceptuando el ultimo
principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = x:(principio xs)

-- d -devuelve una lista con los mismos elementos que la lista de elementos t dada pero en orden inverso
reverso :: [t] -> [t]
reverso (x:[]) = [x]
reverso (x:xs) = reverso(xs)++[x] -- using ++ as the function returns a list as a requirement

--- 2