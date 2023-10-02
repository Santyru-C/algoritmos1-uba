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
    sroot: float = (n ** (1/2))
    return sroot

print(raiz_cuadrada_de(3))