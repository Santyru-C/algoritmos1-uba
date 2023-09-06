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

--- 7

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    | head == 0 = True
    | (mod (head) 10) == mod x 10 = todosDigitosIguales(head)
    | otherwise = False
    where head = div x 10

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
--- 8 

cantDigitos :: Integer -> Integer
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | i == cantDigitos(n) = mod n 10
    | otherwise = iesimoDigito (div n 10) i

--- 9

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

esCapicua :: Integer -> Bool
esCapicua x
    | x < 10 = True
    | (primerDigito x) == ultimoDigito x = esCapicua(div (mod x (10 ^ (cantDigitos x - 1))) 10)
    | otherwise = False
---
