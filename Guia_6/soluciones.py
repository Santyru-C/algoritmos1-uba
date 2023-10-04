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

##3 Estos ejercicios se deben realizar evitando el uso de declaraciones condicionales.
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

#c
def es_nombre_largo(nombre: str) -> bool:
    """Dado un string, devuelve True si su largo "l" es 3<=l=<8."""
    largo: int = len(nombre)
    res: bool = (3<= largo) and (largo <= 8)
    
    return res

#d
def es_bisiesto(año: int) -> bool:
    """Dado un año, devuelve True si este es bisiesto."""
    mult_400: bool = año % 400 == 0
    mult_4: bool = año % 4 == 0
    mult_100: bool = año % 100 == 0
    res: bool = mult_400 or (mult_4 and (not mult_100))

    return res

##4
##5
#a
def devolver_el_doble_si_es_par(n: float) -> float:
    """Dado un número "n" cualquiera. Devuelve el doble si este es par, en el caso
    contrario devuelve el mismo número."""
    if (n % 2 == 0):
        return n * 2
    else:
        return n

#b
def devolver_el_valor_si_es_par_sino_el_que_sigue1(n: float) -> float: #dale chabon, ¿No quieren poner un nombre más largo?
    """Dado un número, devuelve este mismo si es par. En caso contrario devuelve
    el siguiente. (Utiliza IfElse)"""
    if es_par(n):
        return n
    else:
        return n + 1

def devolver_el_valor_si_es_par_sino_el_que_sigue2(n: float) -> float:
    if es_par(n):
        return n
    if not es_par(n):
        return n + 1

#c
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo_9(n: float) -> float: # really?..
    """Dado un número. Devuelve el doble si este es múltiplo de 3 o devuelve el triple
    si es múltiplo de 9."""
    if (n % 9 == 0):
        return n * 3
    elif (n % 3 == 0):
        return n * 2
    else:
        return n

#d
def lindo_nombre(nombre: str) -> str:
    """Dado un string. Devuelve "¡Tu nombre tiene muchas letras!" si la cantidad
    de caracteres de este es igual o mayor a 5, en caso contrario devuelve "Tu
    nombre tiene menos de 5 caracteres"."""
    if (len(nombre) >= 5):
        return "¡Tu nombre tiene muchas letras!" #n
    
    return "Tu nombre tiene menos de 5 caracteres." #m

#e
def el_rango(n: float) -> float: #chau a los docstring autoexplicativos
    if (n < 5):
        print("Menor a 5")
    elif (n > 10 and n < 20):
        print("Entre 10 y 20")
    elif (n > 20):
        print("Mayor a 20")

el_rango(1)
el_rango(7)
el_rango(11)
el_rango(21)