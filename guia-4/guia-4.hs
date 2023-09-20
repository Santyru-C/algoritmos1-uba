module Guia4 where
-- NO OLVIDAR EL USO DE REDUCCIÓN EN PAPEL PARA VERIFICAR LA RECURSION
-- RECURSION:
-- CASO BASE
-- LLAMADO RECURSIVO QUE REDUZCA AL CASO BASE

--- 1
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

--- 2
parteEntera :: Float -> Integer
parteEntera x
    | (x > -1) && (x < 1) = 0
    | x <= -1 = -1 - parteEntera(x + 1)
    | x >= 1 = 1 + parteEntera(x - 1)

--- 3
{-
problema esDivisible (a:N, b:N): Bool {
    requiere: {True}
    asegura: {res = true si a es divisible por b}
}
-}

esDivisible :: Integer -> Integer -> Bool
esDivisible a b
    | a - b == 0 = True
    | a - b > 0 = (esDivisible (a - b) b)
    | otherwise = False 

--- 4
{-
problema sumaImpares (n:N): sumaImp:N {
    requiere: {True}
    asegura: {res = la suma de los primeros n numeros impares}
}

la suma de los primeros n impares es igual a n²
-}

sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares x = (2 * x - 1) + sumaImpares (x - 1)

--- 5
medioFact :: Integer -> Integer
medioFact x
    | (x == 1) || (x == 0) = 1
    | otherwise = x * medioFact(x - 2)

--- 6
{-
problema sumaDigitos (n:N): N {
    requiere: {True} <-- en haskell requeriremos que el usuario no ingrese n < 1
    asegura: {res = la suma de los digitos de n}
} 
-}
sumaDigitos :: Integer -> Integer
sumaDigitos n
    | p_decimal == 0 = n
    | otherwise = mod n 10 + sumaDigitos(p_decimal)
    where p_decimal = div n 10

--- 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    | head == 0 = True
    | (mod (head) 10) == mod x 10 = todosDigitosIguales(head)
    | otherwise = False
    where head = div x 10

--- 8 
cantDigitos :: Integer -> Integer
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | i == cantDigitos(n) = mod n 10
    | otherwise = iesimoDigito (div n 10) i

--- 9 REVISAR
{-
problema esCapicua (n:N>=0): Bool {
    requiere:{n no comienza con 0}
    asegura:{res = true si n es palíndromo}
}
-}

primerDigito :: Integer -> Integer
primerDigito x = div x (10 ^ (cantDigitos x - 1))

ultimoDigito :: Integer -> Integer
ultimoDigito x = mod x 10

recortarExtremos :: Integer -> Integer
recortarExtremos x = div (mod x (10 ^ (cantDigitos x - 1))) 10

esCapicua :: Integer -> Bool
esCapicua x
    | x < 10 = True
    | (primerDigito x) == (ultimoDigito x) = esCapicua(recortarExtremos x)
    | otherwise = False

--- 10
-- a
{-
problema f1 (n: N>=0): N {
    requiere:{True}
    asegura:{res = la suma de los n primeros terminos de 2^i, i perteneciente a N comenzando desde i = 0}
}
-}
f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2 ^ n + f1 (n - 1)

-- b

{-
problema f2(n: N, q: Float): Float {
    requiere:{True}
    asegura:{res = la suma de los n primeros terminos de q^i, siendo el primer termino con i = 1}
}
-}
f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = q ^ n + f2 (n - 1) q

-- c
f3 :: Integer -> Float -> Float -- la especificacion dice que n => N{0} pero eso no es posible porque el indicide comienza en 1
f3 n q = f2 (n * 2) q

-- d
f4Aux :: Integer -> Integer -> Float -> Float
f4Aux 0 n q = q ^ n
f4Aux i n q = q ^ (i + n) + f4Aux (i - 1) n q

f4 :: Integer -> Float -> Float
f4 n q = f4Aux n n q

--- 11
-- a 
{- 
problema eAprox(n: N>=0): R {
    requiere:{True}
    asegura:{res = a la suma de los primeros n términos de 1/i!, siendo i el indice de la sumatoria comenzando en 0}
}
-}

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / fromIntegral (factorial n)) + eAprox (n - 1)

-- b
e :: Float
e = eAprox 10

--- 12
{-
problema raizDe2Aprox(n:N): R{
    requiere:{True}
    asegura:{res = una aproximacion de (2 ** 1/2) obtenida a partir de el termino sucesionAux n - 1}
    asegura:{n = 1 -> res = 1}
    asegura:{n = 2 -> res = 1.5}
    asegura:{n = 3 -> res = 1.4}
}
-}
sucesionAux :: Integer -> Float
sucesionAux 1 = 2
sucesionAux n = 2 + (1 / sucesionAux (n - 1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesionAux n - 1

--- 13
{-
problema f(n: N, m: N): N { -- es un nested loop ladrones
    requiere:{True}
    asegura:{res = la suma de los primeros n terminos de la suma de los primeros m terminos de la sucesion i}
}
-}

sumatoriaAux :: Integer -> Integer -> Integer
sumatoriaAux i 1 = i
sumatoriaAux i j = (i ^ j) + sumatoriaAux i (j - 1)

sumatoria13 :: Integer -> Integer -> Integer
sumatoria13 1 j = sumatoriaAux 1 j
sumatoria13 i j = sumatoriaAux i j + sumatoria13 (i - 1) j

--- 14
{-
problema sumaPotencias(q:N, n:N, m:N): N { 
    requiere:{True}
    asegura:{res = la suma de todas las potencias de la forma q ^ (a + b)
                1 <= a <= n, 1 <= b <= m}
}
-}

funcionAux14 :: Integer -> Integer -> Integer -> Integer
funcionAux14 q n 1 = q ^ (n + 1)
funcionAux14 q n m = q ^ (n + m) + funcionAux14 q n (m - 1)

-- preguntar si esta bien implementada la consigna ¿Valen potencias repetidas?
sumaPotencias :: Integer -> Integer -> Integer -> Integer -- como uso acumuladores en haskel?, mepa no hay
sumaPotencias q 1 m = funcionAux14 q 1 m
sumaPotencias q n m = funcionAux14 q n m + sumaPotencias q (n - 1) m

--- 15 preguntar por tail recursion / por el tema de los float

sumaRacionalesParcial :: Float -> Float -> Float
sumaRacionalesParcial p 1 = p
sumaRacionalesParcial p q = (p / q) + sumaRacionalesParcial p (q - 1)

sumaRacionales :: Float -> Float -> Float
sumaRacionales 1 m = sumaRacionalesParcial 1 m
sumaRacionales n m = sumaRacionalesParcial n m + sumaRacionalesParcial (n - 1) m

--- 16
-- a
menorDivisorf :: Integer -> Integer -> Integer -- with accumulator
menorDivisorf n d
    | n == d = n
    | mod n d == 0 = d
    | otherwise = menorDivisorf n (d + 1)

-- usar funcion auxiliar

menorDivisorAux :: Integer -> Integer -> Integer
menorDivisorAux n d
    | n == d = n
    | mod n d == 0 = d
    | otherwise = menorDivisorAux n (d + 1)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorAux n 2

-- b
esPrimoAux :: Integer -> Integer -> Bool
esPrimoAux n d
    | d == 1 = True
    | mod n d == 0 = False
    | otherwise = esPrimoAux n (d - 1)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = esPrimoAux n (n - 1)

-- c
devolverMenor :: Integer -> Integer -> Integer
devolverMenor a b
    | a >= b = a
    | otherwise = b

sonCoprimosAux :: Integer -> Integer -> Integer -> Bool
sonCoprimosAux a b n
    | n == 1 = True
    | (mod a n == 0) && (mod b n == 0) = False
    | otherwise = sonCoprimosAux a b (n - 1) 

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b
    | a == 1 || b == 1 = True
    | otherwise = sonCoprimosAux a b (devolverMenor a b)
