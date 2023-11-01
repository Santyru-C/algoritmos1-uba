import random

### ARCHIVOS
##1
#a
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(f"{nombre_archivo}.txt", "r")
    
    line_list: [str] = archivo.readlines()
    archivo.close()
    return len(line_list)

#b
def existe_palabra(palabra:str ,nombre_archivo: str) -> bool:
    with open(f"{nombre_archivo}.txt", "r", encoding="utf-8") as archivo:
        line_list: [str] = archivo.readlines()

        for line in line_list:
            if palabra in line:
                return True
            
        return False
    
#c
def cantidad_de_apariciones(nombre_archivo: str, palabra: str) -> int:
    with open(nombre_archivo, "r", encoding="utf-8") as archivo:
        line_list: [str] = archivo.readlines()
        count: int = 0

        for line in line_list:
            for word in line.split(" "):
                print(word)
                if word.strip() == palabra:
                    count += 1


        return count

##2
def clonar_sin_comentarios(nombre_archivo: str):  # argumento de tipo in
    lineas_sin_comentario: [str] = []
    with open(f"{nombre_archivo}.txt", "r", encoding="utf-8") as archivo:
        line_list: [str] = archivo.readlines()
        
        for line in line_list:
            if line.strip()[0] != "#":
                lineas_sin_comentario.append(line)

    with open(nombre_archivo + "_sin_comentarios.txt", "w", encoding="utf-8") as sin_comentarios:
        sin_comentarios.writelines(lineas_sin_comentario)

##3
def invertir(nombre_archivo: str) -> None:
    with open(f"{nombre_archivo}.txt", "r", encoding="utf-8") as archivo:
        archivo_invertido = open("reverso.txt", "w", encoding="utf-8")
        
        line_list: [str] = archivo.readlines()
        archivo_invertido.writelines(reversed(line_list)) # me parecio mas ahorrativo hacerlo de esta manera.
        #for line in reversed(line_list):
            #archivo_invertido.write(line)
        
        archivo_invertido.close()

##4
def agregar_frase(nombre_archivo: str, frase: str) -> None:
    with open(f"{nombre_archivo}.txt", "a", encoding="utf-8") as archivo:
        archivo.write(frase)

##5
def agregar_frase_ini(nombre_archivo: str, frase: str) -> None:
    line_list: [str] = []
    
    archivo = open(f"{nombre_archivo}.txt", "r", encoding="utf-8")
    line_list: [str] = archivo.readlines()
    archivo.close()

    print(line_list)

    archivo2 = open(f"{nombre_archivo}.txt", "w", encoding="utf-8")
    archivo2.write(frase + "\n")
    archivo2.writelines(line_list)

##6
def leer_binario(nombre_archivo: str) -> [str]:
    with open(f"{nombre_archivo}.txt", "rb") as archivo:
        print(archivo.read())

##7
def extraer_info_notas():
    formatted_data: [[str]] = []

    with open("notas.csv", "r") as archivo:
        raw_data: [str] = archivo.readlines()
        for line in raw_data:
            formatted_data.append(line.rstrip().split(","))

    return formatted_data

def promedio_estudiante(lu: str) -> float: #argumento de tipo in es el nr de libreta universitaria del estudiate del cual queremos saber el promedio
    formatted_data: [[str]] = extraer_info_notas()
    notas_alumno: [int] = []

    for entry in formatted_data:
        if entry[0] == lu:
            notas_alumno.append(float(entry[3]))
        
    promedio: float = sum(notas_alumno) / len(notas_alumno)

    return round(promedio, 2)

### PILAS
from queue import LifoQueue as Pila

##8
def generar_numeros_al_azar(n: int, desde: int, hasta: int) -> Pila: #todos los parámetros son de tipo in
    p: Pila = Pila()

    for i in range(0, n):
        p.put(random.randint(desde, hasta))

    return p

##9
def trasladar_elementos(p1: Pila, p2: Pila) -> Pila:
    while not p1.empty():
        p2.put(p1.get())

    return p2

def cantidad_de_elementos(p: Pila) -> int: #parámetro de entrada de tipo in (no podemos modificarlos)
    contador: int = 0
    pila_aux: Pila = Pila()

    while not p.empty():
        e = p.get()
        pila_aux.put(e)
        contador += 1

    trasladar_elementos(pila_aux, p)

    return contador

##10
def imprimir_pila(p: Pila) -> None:
    aux_p: Pila = Pila()
    while not p.empty():
        e = p.get()
        print(e)
        aux_p.put(e)

    trasladar_elementos(aux_p, p)

def buscar_el_maximo(p: Pila) -> int: #parámetro de entrada p de tipo in.
    maximo: int = p.get()
    aux_p: Pila = Pila()
    aux_p.put(maximo)

    while not p.empty():
        e: int = p.get()

        if maximo < e:
            maximo = e
        
        aux_p.put(e)

    trasladar_elementos(aux_p, p)
    
    return maximo

##11
def esta_bien_balanceada(s: str) -> bool:
    splitted: [str] = [*s] #unpack the string into a list
    bracket_list: [str] = []
    aux_list: [str] = []
    
    for character in splitted:
        if character == "(" or character == ")":
            bracket_list.append(character)

    for i in range(0, len(bracket_list), 1):
        aux_string = bracket_list[i] + bracket_list[-1 - i]

        if not "(" in aux_string or not ")" in aux_string:
            return False
        
    return True

##12
def evaluar_en_postfix(e: str) -> float: # puna sencilla con eval ADVERTENCIA: USAR EVAL ES RIESGOSO
    token_list: [str] = e.split(" ")
    number_stack: Pila = Pila()

    for token in token_list:
        if token in ["+", "-", "*", "/"]:
            operando_der = number_stack.get()
            operando_izq = number_stack.get()
            ecuation: str = operando_izq+token+operando_der
            result = eval(ecuation)
            number_stack.put(str(result))

        else:
            number_stack.put(token)

    return float(number_stack.get())

def evaluar_en_postfix(e: str) -> float: #ahora una SIN eval
    pass #TO DO

### COLAS
from queue import Queue as Cola
##13
def random_queue(values: Pila) -> Cola:
    q: Cola = Cola()
    
    for i in range(0, values.qsize()):
        q.put(values.get())

    return q

##14
def cantidad_de_elementos_cola(c: Cola) -> int: #tipo de elemento in
    contador: int = 0
    cola_aux: Cola = Cola()

    while not c.empty():
        e = c.get()
        contador += 1
        cola_aux.put(e)
    
    while not cola_aux.empty(): #devolvemos los elementos a la cola original
        e2 = cola_aux.get()
        c.put(e)

    return contador

##15
def buscar_el_maximo_cola(c: Cola) -> int:
    maximo: int = c.get()
    c_aux: Cola = Cola()
    c_aux.put(maximo)

    while not c.empty():
        e: int = c.get()
        c_aux.put(e)
        if e > maximo:
            maximo = e

    trasladar_elementos(c_aux, c) # voy a aprovechar que python no me fuerza a utilizar los tipos declarados para la funcion

    return maximo

##16
def armar_secuencia_de_bingo() -> Cola[int]:
    l_numeros = [*range(0,100)]
    c_numeros = Cola()

    #for i in range(0, len(l_numeros)):
        #n: int = l_numeros[random.randint(0, len(l_numeros - i))]

    while len(l_numeros) > 0:
        n: int = random.choice(l_numeros)
        c_numeros.put(n)
        l_numeros.remove(n)
    
    return c_numeros

def jugar_carton_de_bingo(carton: [int], bolillero: Cola[int]) -> int: #ambos parametros son in, luego modificar funcion
    contador: int = 1

    while len(carton) > 0:
        bolilla: int = bolillero.get()

        if bolilla in carton:
            print(bolilla, contador)
            carton.remove(bolilla)
        
        contador += 1

    return contador

##17
def n_pacientes_urgentes(c: Cola[(int, str, str)]) -> int: #parametro de entrada tipo in
    c_aux: Cola[(int,str,str)] = Cola()
    tipo_prioritario: [int] = [*range(1,4)] #recordar que el 4 no entra en el rango
    contador: int = 0
    
    while not c.empty():
        paciente: (int, str, str) = c.get()
        
        if paciente[0] in tipo_prioritario:
            contador += 1
        
        c_aux.put(paciente)

    trasladar_elementos(c_aux, c)

    return contador        

##18
def atencion_a_clientes(c: Cola[(str, int, bool, bool)]) -> Cola[(str,int, bool, bool)]:
    c_aux: Cola[(str,int,bool,bool)] = Cola() # esta cola va a guardar los valores de la cola original
    c_disc: Cola[(str,int,bool,bool)] = Cola()
    c_pref: Cola[(str,int,bool,bool)] = Cola()
    c_comun: Cola[(str,int,bool,bool)] = Cola()
    c_final: Cola[(str,int,bool,bool)] = Cola()

    while not c.empty():
        cliente: (str, int, bool, bool) = c.get()
        c_aux.put(cliente)

        if cliente[3]:
            c_disc.put(cliente)
        elif cliente[2]:
            c_pref.put(cliente)
        else:
            c_comun.put(cliente)


    trasladar_elementos(c_aux, c) # todo esto se podria poner en una lista e iterarla en lugar de repetir
    trasladar_elementos(c_disc, c_final) # estas sentencias 4 veces
    trasladar_elementos(c_pref, c_final)
    trasladar_elementos(c_comun, c_final)

    return c_final

carton: [int] = [1,2,3,4,5,6,7,8,9,10,11,12]
testq: Cola = armar_secuencia_de_bingo()
cola_clientes = Cola()
cola_clientes.put(("a",1, True, True))
cola_clientes.put(("b",1, True, False))
cola_clientes.put(("c",1, True, True))
cola_clientes.put(("d",1, False, False))
cola_clientes.put(("e",1, False, True))

### DICCIONARIOS
##19
def extraer_palabras_de_archivo(nombre_archivo: str) -> [str]:
    with open(f"{nombre_archivo}.txt", "r") as archivo:
        file_lines: [str] = archivo.readlines()

    palabras: [str] = []
    for line in file_lines:
        palabras.extend(line.strip().split(" "))

    return palabras

def agrupar_por_longitud(nombre_archivo: str) -> dict:
    palabras: [str] = extraer_palabras_de_archivo(nombre_archivo)
    d: dict = {}

    for p in palabras:
        if not p in d.keys():
            d[p] = 1
        else:
            d[p] += 1

    return d

##20
def promedio_estudiantes() -> dict:
    formatted_data: [str] = extraer_info_notas()
    d_notas: dict = {}
    d_promedios: dict = {} #utilizo otro dict para conservar la info de las notas

    for entry in formatted_data:
        lu: str = entry[0]
        nota: float = float(entry[3])

        if not lu in d_notas:
            d_notas[lu] = []

        d_notas[lu].append(nota)

    for est, notas in d_notas.items():
        d_promedios[est] = round(sum(notas) / len(notas), 2)
    
    return d_promedios

print(promedio_estudiantes())

