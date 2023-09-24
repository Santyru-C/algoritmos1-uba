module Guia_3.Test_suite3 where

import Test.HUnit
import Guia_3.Soluciones

run = runTestTT tests

tests = TestList [
    TestLabel "absoluto" testSuiteAbsoluto,
    TestLabel "maximoAbsoluto" testSuiteMaximoAbsoluto,
    TestLabel "maximo3" testSuiteMaximo3,
    TestLabel "algunoEs0g" testSuiteAlgunoEs0,
    TestLabel "ambosSon0p" testSuiteAmbosSon0,
    TestLabel "mismoIntervalo" testSuiteMismoIntervalo,
    TestLabel "sumaDistintos" testSuiteSumaDistintos,
    TestLabel "esMultiploDe" testSuiteEsMultiploDe,
    TestLabel "digitoUnidades" testDigitoUnidades,
    TestLabel "digitoDecenas" testDigitoDecenas
    ]

testSuiteAbsoluto = test [
    "número positivo:" ~: (absoluto 3) ~?= 3,
    "número negativo" ~: (absoluto (-3)) ~?= 3,
    "cero" ~: (absoluto 0) ~?= 0
    ]

testSuiteMaximoAbsoluto = test [
    "primero positivo mayor" ~: (maximoAbsoluto 5 1) ~?= 5,
    "segundo positivo mayor" ~: (maximoAbsoluto 1 5) ~?= 5,
    "primero negativo mayor" ~: (maximoAbsoluto (-5) 1) ~?= 5,
    "segundo negativo mayor" ~: (maximoAbsoluto 1 (-5)) ~?= 5,
    "ambos negativos" ~: (maximoAbsoluto (-3) (-5)) ~?= 5,
    "ambos iguales" ~: (maximoAbsoluto 3 3) ~?= 3
    ]

testSuiteMaximo3 = test [
    "primero mayor" ~: (maximo3 3 2 1) ~?= 3,
    "segundo mayor" ~: (maximo3 2 3 1) ~?= 3,
    "tercero mayor" ~: (maximo3 1 2 3) ~?= 3,
    "casos negativos" ~: (maximo3 (-3) (-2) (-1)) ~?= (-1)
    ]

testSuiteAlgunoEs0 = test [
    "primero es 0" ~: (algunoEs0g 0 1.1) ~?= True,
    "segundo es 0" ~: (algunoEs0g 1.1 0) ~?= True,
    "ninguno es 0" ~: (algunoEs0g 1 1) ~?= False
    ]

testSuiteAmbosSon0 = test [
    "ninguno es 0" ~: (ambosSon0p 1.1 1.1) ~?= False,
    "ambos son 0" ~: (ambosSon0p 0 0) ~?= True
    ]

testSuiteMismoIntervalo = test [
    "pertenecen al primer intervalo" ~: (mismoIntervalo (-100) 3) ~?= True,
    "pertenecen al segundo intervalo" ~: (mismoIntervalo 4 7) ~?= True,
    "pertenecen al tercer intervalo" ~: (mismoIntervalo 8 100) ~?= True,
    "intervalos distintos" ~: (mismoIntervalo 3 9) ~?= False 
    ]

testSuiteSumaDistintos = test [
    "todos iguales" ~: (sumaDistintos 1 1 1) ~?= 1,
    "todos distintos" ~: (sumaDistintos 1 2 3) ~?= 6,
    "alguno igual" ~: (sumaDistintos 1 1 3) ~?= 4
    ]

testSuiteEsMultiploDe = test [
    "a y b son multiplos" ~: (esMultiploDe 4 2) ~?= True,
    "a y b no son multiplos" ~: (esMultiploDe 4 3) ~?= False
    ]

testDigitoUnidades = test [
    "n tiene una cifra" ~: (digitoUnidades 1) ~?= 1,
    "n tiene más de una cifra" ~: (digitoUnidades 12) ~?= 2
    ]

testDigitoDecenas = test [
    "n tiene una cifra" ~: (digitoDecenas 1) ~?= 0,
    "n tiene dos cifras" ~: (digitoDecenas 12) ~?= 1,
    "n tiene mas de dos cifras" ~: (digitoDecenas 123) ~?= 2
    ]