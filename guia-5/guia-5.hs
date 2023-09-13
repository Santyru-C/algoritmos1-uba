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

-- c
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:[]) = True
todosDistintos (x:xs)
    | pertenece x (xs) = False
    | otherwise = todosDistintos xs

-- d
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos xs = not (todosDistintos xs)

-- e
quitar :: (Eq t) => t -> [t] -> [t]
quitar n (x:xs)
    | n == x = xs
    | n /= x = [x] ++ quitar n xs
-- f
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos n xs
    | xs == [] = []
    | n == h = quitarTodos n (t)
    | n /= h = [head xs] ++ quitarTodos n (t)
    where
        h = head xs
        t = tail xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)
    | pertenece x xs = eliminarRepetidos xs -- anto tenia un eliminar repetidos de mas
    | otherwise = [x] ++ eliminarRepetidos xs

-- esta funcion es de anto, testing
mismosElementos :: (Eq t ) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] ys = False
mismosElementos xs [] = False
mismosElementos (x:xs) (y:ys)
    | pertenece x (eliminarRepetidos ys) && pertenece y (eliminarRepetidos xs) && mismosElementos (eliminarRepetidos xs) (eliminarRepetidos ys) = True
    | otherwise = False