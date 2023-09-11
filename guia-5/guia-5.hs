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
-- a
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys)
    | x == y = True
    | otherwise = pertenece x ys

-- b
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:[]) = True
todosIguales (x:y:xs) --recordar que el operador (:) solo se puede usar con (elem:list)
    | x == y = todosIguales (y:xs)
    | otherwise = False