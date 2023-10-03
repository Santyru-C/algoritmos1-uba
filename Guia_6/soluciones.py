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

print()