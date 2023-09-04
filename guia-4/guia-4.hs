-- NO OLVIDAR EL USO DE REDUCCIÓN EN PAPEL PARA VERIFICAR LA RECURSION
-- RECURSION:
-- CASO BASE
-- LLAMADO RECURSIVO QUE REDUZCA AL CASO BASE

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

--
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x
    | head == 0 = True
    | (mod (head) 10) == mod x 10 = todosDigitosIguales(head)
    | otherwise = False
    where head = div x 10

---