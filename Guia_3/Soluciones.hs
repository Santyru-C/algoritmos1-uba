module Guia_3.Soluciones where
-- COMPLETA - FALTAN PRUEBAS DE UNIDAD
doubleMe x = x + x

---1
--a
ejercicio1a :: Integer -> Integer
ejercicio1a x 
    | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16

--b
ejercicio1b :: Integer -> Integer
ejercicio1b 8 = 16
ejercicio1b 16 = 4
ejercicio1b 131 = 1

--c
ejercicio1c :: Integer -> Integer
ejercicio1c x = (ejercicio1b(ejercicio1a x))

--d
ejercicio1d :: Integer -> Integer
ejercicio1d x = (ejercicio1a(ejercicio1b x))

---2
--a
absoluto :: Integer -> Integer
absoluto x
    | x < 0 = (-x)
    | otherwise = x

--b
absolutoFloat :: Float -> Float
absolutoFloat x
    | x < 0 = -x
    | otherwise = x

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y
    | absx > absy = absx
    | otherwise = absy
    where 
        absx = absoluto x
        absy = absoluto y

--c
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z
    | (x > y) && (x > z) = x
    | (y > x) && (y > z) = y
    | otherwise = z

--d
algunoEs0p :: Float -> Float -> Bool
algunoEs0p 0 _ = True
algunoEs0p _ 0 = True
algunoEs0p _ _ = False

algunoEs0g :: Float -> Float -> Bool
algunoEs0g x y
    | x == 0 || y == 0 = True
    | otherwise = False

--e
ambosSon0p :: Float -> Float -> Bool
ambosSon0p 0 0 = True
ambosSon0p _ _ = False

ambosSon0g :: Float -> Float -> Bool
ambosSon0g x y
    | (x == 0) && (y == 0) = True
    | otherwise = False

--f
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y
    | (x <= 3) && (y <= 3) = True
    | ((x > 3) && (x <= 7)) && ((y > 3) && (y <= 7)) = True
    | (x > 7) && (y > 7) = True
    | otherwise = False

--g
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
    | (x /= y) && (y /= z) = x + y + z
    | (x == y) && (y /= z) = y + z
    | (x /= y) && (y == z) = x + z
    | otherwise = x

--h
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y
    | (mod x y == 0) = True
    | otherwise = False

esMultiploDep :: Integer -> Integer -> Bool
esMultiploDep x y = (mod x y == 0) || False

--i
digitoUnidades :: Integer -> Integer
digitoUnidades x = (mod x 10)

--j
digitoDecenas :: Integer -> Integer
digitoDecenas x = div ((mod x 100) - (digitoUnidades x)) 10

---3
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = (a*a + a*b*c == 0) || False
    where c = (-(div (a*a) (a*b)))

---4
--a
{- 
problema prodInt ((Float, Float), (Float, Float)): Float {
    requiere: {True}
    asegura: {res = al producto escalar entre ambas tuplas}
}
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (x, y) (a, b) = (x*a) + (y*b)

--b
{-
problema todoMenor (p1:(Float, Float), p2:(Float, Float)): Bool {
    requiere: {True}
    asegura: {res = true si la primer y segunda coordenada de la primera tupla 
                son menores a la primer y segunda coordenada de la segunda tupla 
                respectivamente}
}
-}
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (x, y) (a, b) = ((x < a) && (y < b)) || False

--c
{-
problema distanciaPuntos (p1:(Float, Float), p2:(Float, Float)): Bool {
    requiere: {True}
    asegura: {res = la distancia euclidiana entre los dos puntos}
}
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x, y) (a, b) = ((a-x)**2 + (b-y)**2)**(1/2)

--d
{-
problema sumaTerna (terna:(Integer, Integer, Integer)): Integer {
    requiere: {True}
    asegura: {res = la suma de los tres elementos de la terna}
}
-}

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y , z) = x + y + z

--e
{-
problema sumarSoloMultiplos(terna:(Integer, Integer, Integer), n:Nat): Integer {
    requiere: {n > 0}
    asegura: {res = la suma de los elementos de la terna que son multiplos
        de n}
}
-}
devolverSiEsMultiplo :: Integer -> Integer -> Integer
devolverSiEsMultiplo x y
    | esMultiploDe x y = x
    | otherwise = 0

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x, y, z) n = (devolverSiEsMultiplo x n)
                                + (devolverSiEsMultiplo y n) 
                                + (devolverSiEsMultiplo z n)

--f
{-
problema posPrimerPar (terna:(Integer, Integer, Integer)): Integer {
    requiere: {True}
    asegura: {res = la posicion del primer número par en la terna}
    asegura: {res = 4 si ningún número es par}
}
-}

esPar :: Integer -> Bool
esPar x = esMultiploDe x 2

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z)
    | esPar x = 0
    | esPar y = 1
    | esPar z = 2
    | otherwise = 4

--g
{-
problema crearPar (dupla:(a, b)): (a ,b){
    requiere: {True}
    asegura: {res = a un par ordenado compuesto por los elementos a y b en el orden dado}
}
-}

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

--h
{-
problema invertir (dupla:(a, b)): (b, a) {
    requiere: {True}
    asegura: {res = una dupla que posee los valores de la dupla original con las posiciones invertidas}
}
-}

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

---5
aux1 :: Integer -> Integer
aux1 x
    | x <= 7 = x * x
    | otherwise = (2 * x) - 1

aux2 :: Integer -> Integer
aux2 x
    | esPar x = div x 2
    | otherwise = (3 * x) + 1

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x, y, z) = (aux1 x > aux2 x) && (aux1 y > aux2 y) && (aux1 z > aux2 z)

---6
bisiesto :: Integer -> Bool
bisiesto x
    | esMultiploDe x 100 = esMultiploDe x 400
    | otherwise = esMultiploDe x 4

---7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1, y1, z1) (x2, y2, z2) = absolutoFloat(x1-x2) + absolutoFloat(y1-y2) + absolutoFloat(z1-z2)

---8
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = (mod x 10) + (mod (div x 10) 10)

comparar :: Integer -> Integer -> Integer
comparar x y
    | a < b = 1
    | a > b = (-1)
    | a == b = 0
    where
        a = sumaUltimosDosDigitos x
        b = sumaUltimosDosDigitos y

---9 (Hacelo en la carpeta VAGO)

