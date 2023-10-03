import math
##1

#a
def imprimir_hola_mundo() -> str:
    print("¡Hola Mundo!")

#b
def imprimir_un_verso() -> str:
    print("Un elefante se balanceaba sobre la tela de una araña\nComo veia que resistia fueron a llamar a otro elefante")

#c
def raizDe2() -> float:
    res: float = round(2 ** (1/2), 2)
    return res

#d
def factorial_de_dos() -> int:
    return 2

#e
def perimetro() -> float:
    res: float = 2 * math.pi
    return res

##2
#a
def imprimir_saludo(nombre: str) -> str:
    print("Hola " + nombre)

#b
def raiz_cuadrada_de(n: float) -> float:
    """requires a floating point number and returns the square root of it"""
    sroot: float = (n ** (1/2))
    return sroot

#c
def farenheit_a_celcius(temp_far: float) -> float:
    """
    req: temperatura en farenheit (R)
    return: temperatura en celcius (R)
    """

    temp_cel: float = ((temp_far - 32) * 5) / 9
    return round(temp_cel, 4)
    
#d
def imprimir_dos_veces(estribillo: str) -> str:
    """Dado un string, devuelve ese mismo string duplicado"""
    print(estribillo*2)

#e
def es_multiplo_de(n: int, m: int) -> bool:
    """Dados dos valores enteros, m != 0, determina si n es multiplo de m"""
    res: bool = (n % m) == 0
    return res

#f
def es_par(n:int) -> bool:
    """Dado un número entero, determina si ese mismo número es par."""
    res: bool = es_multiplo_de(n, 2)
    return res

#g
def cantidad_de_pizzas(comensales: int, min_cant_porciones: int) -> int:
    """Dado un número de comensales y una cantidad mínima de porciones por cada uno.
    Devuelve la cantidad necesaria de pizzas de 8 porciones teniendo en cuenta que se
    prefiere que sobren porciones."""

    total_porciones: int = comensales * min_cant_porciones
    cantidad_de_pizzas: float = total_porciones / 8
    res: int = math.ceil(cantidad_de_pizzas)

    return res

##3
#a
def alguno_es_0(n1: float, n2: float) -> bool:
    """Dados dos números racionales, se devolverá True si alguno de los dos es igual a 0."""
    res: bool = (n1 == 0) or (n2 == 0)
    return res

#b
def ambos_son_0(n1: float, n2: float) -> bool:
    """Dados dos números racionales, se devolverá True si ambos son 0."""
    res: bool = (n1 == 0) and (n2 == 0)
    return res

print(ambos_son_0(1,0))