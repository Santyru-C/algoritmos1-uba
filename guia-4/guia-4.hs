-- NO OLVIDAR EL USO DE REDUCCIÓN EN PAPEL PARA VERIFICAR LA RECURSION
-- RECURSION:
-- CASO BASE
-- LLAMADO RECURSIVO QUE REDUZCA AL CASO BASE

---

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

--

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
-}


---

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    | head == 0 = True
    | (mod (head) 10) == mod x 10 = todosDigitosIguales(head)
    | otherwise = False
    where head = div x 10

---