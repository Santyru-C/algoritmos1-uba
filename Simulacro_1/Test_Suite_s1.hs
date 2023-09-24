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
    TestLabel "sacarRepetidos" testSuiteSacarRepetidos
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