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

---2
seEncuentraEnRelacion :: String -> (String, String) -> Bool
seEncuentraEnRelacion persona (a,b)
    | persona == a || persona == b = True
    | otherwise = False

extraerAmigoDeTupla :: String -> (String, String) -> String
extraerAmigoDeTupla persona (a, b)
    | persona == a = b
    | otherwise = a

amigosDe :: String -> [Relacion] -> [String]
amigosDe persona [] = []
amigosDe persona (rel:relaciones)
    | seEncuentraEnRelacion persona rel = [extraerAmigoDeTupla persona rel] ++ amigosDe persona relaciones
    | otherwise = amigosDe persona relaciones

---3
aplanarListaDeRelaciones :: [Relacion] -> [String]
aplanarListaDeRelaciones [] = []
aplanarListaDeRelaciones ((a,b):xs) = [a] ++ [b] ++ aplanarListaDeRelaciones xs

sacarRepetidos :: [String] -> [String]
sacarRepetidos [] = []
sacarRepetidos (x:xs)
    | elem x xs = sacarRepetidos xs
    | otherwise = [x] ++ sacarRepetidos xs

personas :: [Relacion] -> [String]
personas [] = []
personas relaciones = sacarRepetidos (aplanarListaDeRelaciones relaciones)

---4
repeticionesDe :: String -> [String] -> Integer
repeticionesDe e [] = 0
repeticionesDe e (x:xs)
    | e == x = 1 + repeticionesDe e xs
    | otherwise = repeticionesDe e xs

extraerElemento :: String -> [String] -> [String]
extraerElemento e [] = []
extraerElemento e (x:xs)
    | e == x = extraerElemento e xs
    | otherwise = [x] ++ extraerElemento e xs

cantidadDeAmigosPorPersona :: [String] -> [(String, Integer)]
cantidadDeAmigosPorPersona [] = []
cantidadDeAmigosPorPersona xs = [((head xs), repeticionesDe (head xs) xs)] ++ cantidadDeAmigosPorPersona (extraerElemento (head xs) xs)

tuplaDeRepetidos :: String -> [String] -> (String, Integer)
tuplaDeRepetidos per xs = (per, repeticionesDe per xs)

personaConMasAmigosAux :: [(String, Integer)] -> String
personaConMasAmigosAux [(pers, num)] = pers
personaConMasAmigosAux ((a,b):(c,d):xs)
    | b >= d = personaConMasAmigosAux ((a,b):xs)
    | otherwise = personaConMasAmigosAux ((c,d):xs)

personaConMasAmigos :: [Relacion] -> String
personaConMasAmigos [] = []
personaConMasAmigos xs = personaConMasAmigosAux (cantidadDeAmigosPorPersona (aplanarListaDeRelaciones xs))