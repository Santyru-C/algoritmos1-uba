module Simulacro_1.Test_Suite_s1 where

import Simulacro_1.Simulacro
import Test.HUnit

-- Constantes --
p1 = "Juan"
p2 = "Maria"
p3 = "Carlos"
p4 = "Ana"

rel1 = (p1, p2)
rel1i = (p2, p1)
rel2 = (p3, p4)
rel2i = (p4, p3)
rel3 = (p1, p3)

listaValida1 = [rel1]
listaValida2 = [rel1, rel2]
listaInvalida1 = [rel1, rel1]
listaInvalida2 = [rel2, rel2i]

listaDePersonas1 = [p1, p2, p3, p4]

run = runTestTT tests

tests = TestList [
    TestLabel "relacionesValidas" testSuiteRelacionesValidas,
    TestLabel "tieneRepetidos" testSuiteTieneRepetidos,
    TestLabel "amigosDe" testSuiteAmigosDe,
    TestLabel "seEncuentraEnRelacion" testSuiteSeEncuentraEnRelacion,
    TestLabel "aplanarListaDeRelaciones" testSuiteAplanarListaDeRelaciones,
    TestLabel "sacarRepetidos" testSuiteSacarRepetidos,
    TestLabel "personas" testSuitePersonas,
    TestLabel "personaConMasAmigos" testSuitePersonaConMasAmigos,
    TestLabel "repeticionesDe" testSuiteRepeticionesDe,
    TestLabel "tuplaDeRepetidos" testSuiteTuplaDeRepetidos
    ]

testSuiteTieneRepetidos = test [
    "lista vacia" ~: (tieneRepetidos rel1 []) ~?= False,
    "repetidos iguales" ~: (tieneRepetidos rel1 listaValida1) ~?= True,
    "repetidos permutados" ~: (tieneRepetidos rel1 [rel1i]) ~?= True,
    "no tiene repetidos" ~: (tieneRepetidos rel1 [rel2]) ~?= False
    ]

testSuiteRelacionesValidas = test [
    "lista vacia" ~: (relacionesValidas []) ~?= True,
    "una relación valida" ~: (relacionesValidas listaValida1) ~?= True,
    "dos relaciones validas" ~: (relacionesValidas listaValida2) ~?= True,
    "dos relaciones repetidas" ~: (relacionesValidas listaInvalida1) ~?= False,
    "dos relaciones iguales" ~: (relacionesValidas listaInvalida2) ~?= False
    ]

testSuiteSeEncuentraEnRelacion = test [ --no pueden ingresar tuplas vacias porque iria en contra de los requerimientos
    "persona en relacion" ~: (seEncuentraEnRelacion p1 rel1) ~?= True,
    "persona sin relacion" ~: (seEncuentraEnRelacion p1 rel2) ~?= False
    ]

testSuiteAmigosDe = test [
    "lista de relaciones vacia" ~: (amigosDe p1 []) ~?= [],
    "persona con relaciones" ~: (amigosDe p1 [(p1,p2),(p1,p3),(p1,p4)]) ~?= [p2,p3,p4],
    "persona sin relaciones" ~: (amigosDe p1 [(p2,p3),(p2,p4)]) ~?= []
    ]

testSuiteAplanarListaDeRelaciones = test [
    "lista vacia" ~: (aplanarListaDeRelaciones []) ~?= [],
    "lista con una relacion" ~: (aplanarListaDeRelaciones listaValida1) ~?= [p1, p2],
    "lista con varias relaciones" ~: (aplanarListaDeRelaciones listaValida2) ~?= [p1, p2, p3, p4]
    ]

testSuiteSacarRepetidos = test [
    "lista vacia" ~: (sacarRepetidos []) ~?= [],
    "lista con repetidos" ~: (sacarRepetidos [p1, p2, p1, p2]) ~?= [p1, p2],
    "lista sin repetidos" ~: (sacarRepetidos listaDePersonas1) ~?= listaDePersonas1
    ]

testSuitePersonas = test [
    "lista vacia" ~: (personas []) ~?= [],
    "lista sin repetir personas" ~: (personas listaValida2) ~?= listaDePersonas1,
    "lista con personas repetidas" ~: (esPermutacion (personas [rel1, rel3]) [p1,p2,p3]) ~?= True
    ]

testSuitePersonaConMasAmigos = test [
    "una persona con mas amigos" ~: (personaConMasAmigos [rel1, rel2, rel3]) ~?= p1,
    "misma cantidad de amigos" ~: ((personaConMasAmigos listaValida1) == p1 || personaConMasAmigos listaValida1 == p2) ~?= True
    ]

testSuiteRepeticionesDe = test [
    "lista vacia" ~: (repeticionesDe p1 []) ~?= 0,
    "lista con repeticiones" ~: (repeticionesDe p1 [p1,p1,p1,p2,p1]) ~?= 4,
    "lista sin repeticiones" ~: (repeticionesDe p1 [p1,p2,p3,p4]) ~?= 1,
    "lista no contiene al elemento" ~: (repeticionesDe p1 [p2, p3, p4]) ~?= 0
    ]

testSuiteTuplaDeRepetidos = test [
    "lista vacia" ~: (tuplaDeRepetidos p1 []) ~?= (p1, 0),
    "sin repetidos" ~: (tuplaDeRepetidos p1 [p2, p3, p4]) ~?= (p1, 0),
    "con repetidos" ~: (tuplaDeRepetidos p1 [p1, p1, p2]) ~?= (p1, 2)
    ]

--- funciones aux
extraerElemento :: String -> [String] -> [String]
extraerElemento e [] = []
extraerElemento e (x:xs)
    | e == x = extraerElemento e xs
    | otherwise = [x] ++ extraerElemento e xs

esPermutacion :: [String] -> [String] -> Bool
esPermutacion [] [] = True
esPermutacion xs ys
    | length xs == length ys = esPermutacion trimmedxs trimmedys
    | otherwise = False
    where
        a = head xs
        trimmedxs = extraerElemento a xs
        trimmedys = extraerElemento a ys