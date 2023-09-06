-- NO OLVIDAR EL USO DE REDUCCIÓN EN PAPEL PARA VERIFICAR LA RECURSION
-- RECURSION:
-- CASO BASE
-- LLAMADO RECURSIVO QUE REDUZCA AL CASO BASE

---

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

---

parteEntera :: Float -> Integer
parteEntera x
    | (x > -1) && (x < 1) = 0
    | x <= -1 = -1 - parteEntera(x + 1)
    | x >= 1 = 1 + parteEntera(x - 1)
---
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

---

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

---

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    | head == 0 = True
    | (mod (head) 10) == mod x 10 = todosDigitosIguales(head)
    | otherwise = False
    where head = div x 10

---