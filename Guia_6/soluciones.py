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

#f
def consultar_vacaciones(sexo: str, edad: int) -> str:
    vacaciones: str = "Andá de vacaciones"
    trabajar: str = "Te toca trabajar"
    menor_de_edad: bool = edad < 18

    if (sexo == "M"):
        if (menor_de_edad or edad >= 65):
            print(vacaciones)
        else:
            print(trabajar)
    
    if (sexo == "F"):
        if (menor_de_edad or edad >= 60):
            print(vacaciones)
        else:
            print(trabajar)

def consultar_vacaciones1(sexo: str, edad: int) -> str: #creo que lo podemos hacer mas simple
    vacaciones: str = "Andá de vacaciones"
    trabajar: str = "Te toca trabajar"
    menor_de_edad: bool = edad < 18
    m_edad_laboral: bool = (sexo == "M") and (edad < 65)
    f_edad_laboral: bool = (sexo == "F") and (edad < 60)

    if menor_de_edad:
        print(vacaciones)
    elif (m_edad_laboral or f_edad_laboral):
        print(trabajar)
    else:
        print(vacaciones)

##6
#a
def count_to_ten() -> None:
    i: int = 0
    while i < 10:
        i += 1
        print(i)

#b
def even_from_10_to_40() -> None:
    i: int = 10
    while (i <= 40):
        print(i)
        i += 2

#c
def eco10() -> None:
    i: int = 0
    while i < 10:
        print("echo")
        i += 1

#d
def cuenta_regresiva_para_despegue(inicio: int) -> None:
    i = inicio

    while i >= 1:
        print(i)
        i -= 1

    print("Despegue")

#e
def monitor_de_viaje_en_el_tiempo(inicio: int, llegada: int) -> None:
    año_actual: int = inicio
    salto: int = 1

    while año_actual > llegada:
        año_actual -= salto
        print("Viajo un año al pasado, estamos en el año: " + str(año_actual))

#f
def viaje_rapido_al_384AC(inicio: int, salto: int = 20) -> None:
    año_actual: int = inicio
    cociente_del_viaje: int = (año_actual + 384) // 20
    saltos_realizados: int = 0
    
    while saltos_realizados < cociente_del_viaje:
        año_actual -= salto
        saltos_realizados += 1
        print("Viajo 20 años al pasado, estamos en el año: " + str(año_actual))

##7
#a
def count_to_ten_for() -> None:
    for i in range(1, 11):
        print(i)

#b
def even_from_10_to_40_for() -> None:
    for i in range(10, 42, 2):
        print(i)

#c
def eco10_for() -> None:
    for i in range(1, 11):
        print("eco" + str(i))

#d
def cuenta_regresiva_para_el_despegue_for(inicio: int) -> None:
    for i in range(inicio, 0, -1):
        print(i)
    else:
        print("Despegue")

#e
def monitor_de_viaje_en_el_tiempo_for(año_partida: int, año_llegada: int) -> None:
    for i in range(año_partida - 1, año_llegada -1, -1):
        print("Viajó un año al pasado, estamos en el año: %d" % (i))

#f
def dar_formato_al_año(año: int) -> str:
    con_formato: str = "%dAC" % abs(año) if año < 0 else "%dDC" % año

    return con_formato

def viaje_rapido_al_384AC_for(inicio: int, salto: int = 20) -> None:
    año_actual: int = inicio
    cociente_del_viaje: int = (año_actual + 384) // 20
    
    for i in range(0, cociente_del_viaje):
        año_actual -= salto
        print("Viajo 20 años al pasado, estamos en el año: " + dar_formato_al_año(año_actual))

##8
#a
"""
x = 5
//estado a x == 5
y = 7
//estado b y == 7
x = x + y
//estado c 
//vale x == x@a + y@b
"""

#b
"""
nada
//estado a

x = 5
//estado b x == 5

y = 7
//estado c y == 7

z = x + y
//estado d
//vale z == x@c + y@c #vale usar los estados asi? osea x no cambió, puedo usar el de el estado anterior o me tengo que referir a cuando es asignada?

y = z * 2
//estado e
//vale y == z@d * 2
"""

#c
"""
sin modificar
//estado a

x = 5
//estado b x == 5

y = 7
//estado c y == 1

x = "hora"
//estado d x == "hora"

y = x * 2
//estado e
//vale y == x@d * 2
"""

#d
"""
sin modificar
//estado a

x = True
y = False
//estado b
//vale y == False #se puede poner los dos directamente en uno?
//valu x == True

res = x and y
//estado c
//vale res == x@b and y@b

x = res and x
//estado d
//value x == res@c and x@b
"""

