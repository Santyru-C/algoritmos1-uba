import math

def imprimir_hola_mundo() -> str:
    print("¡Hola Mundo!")


def imprimir_un_verso() -> str:
    print("Un elefante se balanceaba sobre la tela de una araña\nComo veia que resistia fueron a llamar a otro elefante")

def raizDe2() -> float:
    res: float = round(2 ** (1/2), 2)
    return res

def factorial_de_dos() -> int:
    return 2

def perimetro() -> float:
    res: float = 2 * math.pi
    return res

print(perimetro())