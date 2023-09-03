doubleMe x = x + x

ejercicio1a :: Integer -> Integer
ejercicio1a x 
    | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16

ejercicio1b :: Integer -> Integer
ejercicio1b 8 = 16
ejercicio1b 16 = 4
ejercicio1b 131 = 1

ejercicio1c :: Integer -> Integer
ejercicio1c x = (ejercicio1b(ejercicio1a x))

ejercicio1d :: Integer -> Integer
ejercicio1d x = (ejercicio1a(ejercicio1b x))

absoluto :: Integer -> Integer
absoluto x
    | x < 0 = (-x)
    | otherwise = x

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y
    | absx > absy = absx
    | otherwise = absy
    where 
        absx = absoluto x
        absy = absoluto y

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z
    | (x > y) && (x > z) = x
    | (y > x) && (y > z) = y
    | otherwise = z

algunoEs0p :: Float -> Float -> Bool
algunoEs0p 0 _ = True
algunoEs0p _ 0 = True
algunoEs0p _ _ = False

algunoEs0g :: Float -> Float -> Bool
algunoEs0g x y
    | x == 0 || y == 0 = True
    | otherwise = False

ambosSon0p :: Float -> Float -> Bool
ambosSon0p 0 0 = True
ambosSon0p _ _ = False

ambosSon0g :: Float -> Float -> Bool
ambosSon0g x y
    | (x == 0) && (y == 0) = True
    | otherwise = False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y
    | (x <= 3) && (y <= 3) = True
    | ((x > 3) && (x <= 7)) && ((y > 3) && (y <= 7)) = True
    | (x > 7) && (y > 7) = True
    | otherwise = False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
    | (x /= y) && (y /= z) = x + y + z
    | (x == y) && (y /= z) = y + z
    | (x /= y) && (y == z) = x + z
    | otherwise = x

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y
    | (mod x y == 0) = True
    | otherwise = False

esMultiploDep :: Integer -> Integer -> Bool
esMultiploDep x y = (mod x y == 0) || False

digitoUnidades :: Integer -> Integer
digitoUnidades x = (mod x 10)

digitoDecenas :: Integer -> Integer
digitoDecenas x = div ((mod x 100) - (digitoUnidades x)) 10

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = (a*a + a*b*c == 0) || False
    where c = (-(div (a*a) (a*b)))

---

{- 
problema prodInt ((Float, Float), (Float, Float)): Float {
    requiere: {True}
    asegura: {res = al producto escalar entre ambas tuplas}
}
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (x, y) (a, b) = (x*a) + (y*b)

---

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

---

{-
problema distanciaPuntos (p1:(Float, Float), p2:(Float, Float)): Bool {
    requiere: {True}
    asegura: {res = la distancia euclidiana entre los dos puntos}
}
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x, y) (a, b) = ((a-x)**2 + (b-y)**2)**(1/2)

---

{-
problema sumaTerna (terna:(Integer, Integer, Integer)): Integer {
    requiere: {True}
    asegura: {res = la suma de los tres elementos de la terna}
}
-}

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y , z) = x + y + z