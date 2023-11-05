import simulacro
from collections import Counter

l1 = [1,0,1,0,2,0]
l2 = [-1, -1, -1, -1, -1]

def es_permutacion(l1: list, l2: list) -> bool:
    mismo_largo: bool = len(l1) == len(l2)
    mismos_items: bool = Counter(l1) == Counter(l2)

    return mismo_largo and mismos_items

class TestUltimaAparicion:
    def test_1(self):
        assert simulacro.ultima_aparicion(l1, 1) == 2
    
    def test_2(self):
        assert simulacro.ultima_aparicion(l1, 0) == 5

    def test_3(self):
        assert simulacro.ultima_aparicion(l2, -1) == len(l2) - 1

    # la lista no puede ser vacía por que e siempre pertenece a ella

class TestElementosExclusivos:
    def test_ambas_listas_iguales(self):
        assert simulacro.elementos_exclusivos(l1, l1) == []
    
    def test_2(self):
        assert simulacro.elementos_exclusivos([1,2,3,4], [1,2,3,5]) == [4,5]
    
    def test_sin_repetidos(self):
        assert simulacro.elementos_exclusivos([1,1,2], [2,3,3]) == [1,3]

    def test_una_lista_vacia(self):
        assert es_permutacion(simulacro.elementos_exclusivos(l1, []), [0,1,2]) == True

    def test_ambas_listas_vacias(self):
        assert simulacro.elementos_exclusivos([],[]) == []

t_ingles1 = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
t_aleman1 = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}

class TestContarTraduccionesIguales:

    def test_diccionario_vacio(self):
        assert simulacro.contar_traducciones_iguales({}, {}) == 0

    def test_parametros_dados(self):
        assert simulacro.contar_traducciones_iguales(t_ingles1, t_aleman1) == 2

    def test_sin_traducciones_iguales(self):
        assert simulacro.contar_traducciones_iguales(t_ingles1, {"Pie": "Fuss"}) == 0

class TestConvertirADiccionario:
    # las claves pueden ser enteros asi que no problemo
    
    def test_lista_vacia(self):
        assert simulacro.convertir_a_diccionario([]) == {}

    def test_parametros_dados(self):
        assert simulacro.convertir_a_diccionario([-1, 0, 4, 100, 100, -1, -1]) == {-1:3, 0:1, 4:1, 100:2}
    
    def test_solo_un_elemento(self):
        assert simulacro.convertir_a_diccionario([0, 0, 0, 0, 0]) == {0: 5}