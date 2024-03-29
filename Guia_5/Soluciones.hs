module Guia_5.Soluciones where
--COMPLETA - FALTA TEST SUITE
import Guia_4.Soluciones
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

-- i devuelve el booleano True si la lista dada es un palíndromo
capicua :: (Eq t) => [t] -> Bool
capicua xs
    | xs == reverso xs = True
    | otherwise = False

--- 3
--a devuelve la suma de todos los números enteros contenidos en la lista dada
sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--b devuelve el producto de todos los valores pertenecientes a la lista dada
productoria :: [Integer] -> Integer
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x * productoria xs

--c devuelve el valor maximo perteneciente a una lista no vacía dada
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:zs)
    | x >= sumatoria(y:zs) = x -- nos ahorramos algunas recursiones
    | x >= y = maximo (x:zs)
    | x <= y = maximo (y:zs)

--d suma n a cada posicion de la lista dada
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) = [n + x] ++ sumarN n xs

--e suma el primer valor de la lista a todos las posiciones de la misma, primero inclusive
sumarPrimero :: [Integer] -> [Integer]
sumarPrimero (x:xs) = sumarN x (x:xs) -- preguntar si quieren esto o complicarla haciendo una nueva funcion desde 0

--f suma el primer valor de la lista a todas las posiciones de la misma, ultimo inclusive
sumarUltimo :: [Integer] -> [Integer]
sumarUltimo xs = sumarN (ultimo xs) xs

--g filtra la lista dada devolviendo una nueva lista solo con los numeros pares de la anterior en el mismo orden
esPar :: Integer -> Bool
esPar x
    | mod x 2 == 0 = True
    | otherwise = False

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | esPar x = [x] ++ pares xs
    | otherwise = pares xs
--como importo la funcion "esPar" de la guia 3?

--i dado un número n y una lista xs, devuelve una lista con los elementos de xs múltiplos de n

filtrar :: Integer -> [Integer] -> [Integer]
filtrar n [] = []
filtrar n (x:xs)
    | n == x = [x] ++ filtrar n xs
    | otherwise = filtrar n xs
-- Dado una lista no vacia de enteros y un n entero, devuelve una lista que contenga todas las recurrencias de n en la lista original


multiplosDeN :: Integer -> [Integer] -> [Integer] --el 0 era multiplo de todos los numeros no?
multiplosDeN 0 xs = filtrar 0 xs
multiplosDeN n [] = []
multiplosDeN n (x:xs)
    | mod x n == 0 = [x] ++ multiplosDeN n xs
    | otherwise = multiplosDeN n xs

--j dado una lista de enteros, devuelve una nueva lista con los elementos ordenados de forma creciente
--tranquilamente podemos usar algun algoritmo de ordenamiento
--empecemos por un naive aproach solo con lo dado en haskell

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar (x:y:zs)
    | x >= y = [y] ++ ordenar (x:zs)
    | otherwise = [x] ++ ordenar (y:zs)

--- 4
-- a
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs)
    | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
    | otherwise = x:(sacarBlancosRepetidos (y:xs))

-- b dada una lista de caracteres, devuelve la cantidad de palabras que tiene
contarEspacios :: [Char] -> Integer
contarEspacios (x:xs)
    | x == ' ' && xs == [] = 1
    | x == ' ' = 1 + contarEspacios xs
    | otherwise = contarEspacios xs

contarPalabras :: [Char] -> Integer -- hice la siguiente primero y pienso usarla para hacer esta
contarPalabras xs = longitud (palabras xs)
--contar letras seguidas, devuelve 1 cuando llega a un espacio en blacno

-- c dada una lista arma una nueva lista con palabras de la lista original
sublistFrom :: Char -> [Char] -> [Char] --return a sublist from the given list starting from the given value
sublistFrom a [] = []
sublistFrom a (x:xs)
    | a == x = (x:xs)
    | otherwise = sublistFrom a xs

extraerPrimera :: [Char] -> [Char]
extraerPrimera [] = []
extraerPrimera (x:xs)
    | x == ' ' = []
    | otherwise = x : extraerPrimera xs

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs)
    | x == ' ' = palabras xs
    | otherwise = extraerPrimera (x:xs) : palabras (sublistFrom ' ' xs)

-- d dada una lista de caracteres devuelve su palabra mas larga
palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [x] = x
palabraMasLargaAux (x:y:zs)
    | xl >= yl = palabraMasLargaAux (x:zs)
    | otherwise = palabraMasLargaAux (y:zs)
    where
        xl = longitud x
        yl = longitud y

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga xs = palabraMasLargaAux (palabras xs)

-- e devuelve una lista de caracteres concatenando una lista de palabras dada
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

-- f a partir de una lista de palabras, arma una lista de caracteres insertando un blanco entre cada palabra
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ [' '] ++ aplanarConBlancos xs

-- g
listFrom :: Integer -> t -> [t] -- return a list containing the passed values n times
listFrom 0 a = []
listFrom n a = a : listFrom (n - 1) a

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] n = []
aplanarConNBlancos [x] n = x
aplanarConNBlancos (x:xs) n = x ++ listFrom n ' ' ++ aplanarConNBlancos xs n -- you can always use replicate for this

--- 5
-- a
sumaAcumuladaAux :: (Num t) => [t] -> [t]
sumaAcumuladaAux [] = []
sumaAcumuladaAux xs = [sumatoria xs] ++ sumaAcumuladaAux (principio xs)

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = reverso (sumaAcumuladaAux xs)

-- b
-- vamos a necesitar funciones que nos cuenten los primos asi que vuelvo un cacho a la guia 4
descomponerEnPrimosAux :: Integer -> Integer -> [Integer]
descomponerEnPrimosAux 1 i = []
descomponerEnPrimosAux n i
    | mod n (nEsimoPrimo i) == 0 = [nEsimoPrimo i] ++ descomponerEnPrimosAux (div n (nEsimoPrimo i)) 1
    | otherwise = descomponerEnPrimosAux n (i + 1)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [descomponerEnPrimosAux x 1] ++ descomponerEnPrimos xs