module Simulacro_1.Simulacro where
type Relacion = (String, String)

tieneRepetidos :: Relacion -> [Relacion] -> Bool
tieneRepetidos (a,b) [] = False
tieneRepetidos (a,b) ((c,d):xs)
    | tuplasRepetidas || tuplasIguales = True
    | otherwise = tieneRepetidos (a,b) xs
    where
        tuplasRepetidas = (a == c) && (b == d)
        tuplasIguales = (a == d) && (b == c)

relacionesValidas :: [Relacion] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs)
    | tieneRepetidos x xs = False
    | otherwise = relacionesValidas xs


amigosDe :: String -> [Relacion] -> [String]
amigosDe persona [] = []