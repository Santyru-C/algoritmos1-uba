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