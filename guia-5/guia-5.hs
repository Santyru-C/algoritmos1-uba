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
-- a devuelve el booleano True en el caso de que un elemento dado pertenezca a una lista dada
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys)
    | x == y = True
    | otherwise = pertenece x ys

-- b devuelve el booleano True en el caso de que todos los elementos de una lista dada sean iguales
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:[]) = True
todosIguales (x:y:xs) --recordar que el operador (:) solo se puede usar con (elem:list)
    | x == y = todosIguales (y:xs)
    | otherwise = False

-- c devuelve el booleano True en el caso de que exista un elemento distinto a otro en una lista dada
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:[]) = True
todosDistintos (x:xs)
    | pertenece x (xs) = False
    | otherwise = todosDistintos xs

-- d devuelve el booleano True en el caso de que existan 2 o mas elementos iguales en una lista
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos xs = not (todosDistintos xs)

-- e quita un elemento dado de la lista dada
quitar :: (Eq t) => t -> [t] -> [t]
quitar n (x:xs)
    | not (pertenece n (x:xs)) = (x:xs)
    | n == x = xs
    | n /= x = [x] ++ quitar n xs

-- f elimina todas las recurrencias de un elemento dado en la lista dada
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos n xs
    | xs == [] = []
    | n == h = quitarTodos n (t)
    | n /= h = [head xs] ++ quitarTodos n (t)
    where
        h = head xs
        t = tail xs

-- g elimina todos los elementos repetidos de la lista dada
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:xs)
    | pertenece x xs = eliminarRepetidos xs -- anto tenia un eliminar repetidos de mas
    | otherwise = [x] ++ eliminarRepetidos xs

-- h devuelve el booleano True en el caso de que todos los elementos de una lista esten en la otra y viceversa. No tiene en cuenta repeticiones
-- esta funcion es de anto, testing
mismosElementos :: (Eq t ) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] ys = False
mismosElementos xs [] = False
mismosElementos (x:xs) (y:ys)
    | x == y = mismosElementos (quitarTodos x (xs1)) (quitarTodos y (ys1)) -- agrego otro caso para evitar saltear la comparacion entre el primer valor de cada lista
    | (pertenece x ys1) && (pertenece y xs1) && (mismosElementos trimmedxs trimmedys) = True -- (aparte) yo modificaria esta linea y llevaria a que el resultado sea la propia llamada recursiva y no true, pero asi ya funciona
    | otherwise = False -- el problema esta en el bloque de arriba, puede suceder que como extrae los primeros valores de la lista, estos no se comparen si son iguales
    where
        xs1 = eliminarRepetidos xs
        ys1 = eliminarRepetidos ys
        trimmedxs = quitarTodos y (quitarTodos x xs1) -- fijate que en estas dos repito lo que declaro excepto la lista
        trimmedys = quitarTodos y (quitarTodos x ys1) -- oseeeaa que es facil extraer una funcion de aca... Hacelo vos

-- i
capicua :: (Eq t) => [t] -> Bool
capicua xs
    | xs == reverso xs = True
    | otherwise = False

--- 3

