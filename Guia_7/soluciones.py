### PARAMETROS
LISTA_NUM1 = [1,2,3,4,5]
LISTA_NUM2 = [2,4,6,8,10]
LISTA_DESORDENADA = [1,4,2,3,5,10,7]
LISTA_PALABRAS1 = ["juan", "carlos", "santiago", "estela", "marianela"]
LISTA_PALABRAS2 = ["a", "b", "c","d","e"]


### PRIMERA PARTE
##1
def pertenece1(s: [int], e: int) -> bool:
    for i in s:
        if i == e:
            return True
        
    else:
        return False

def pertenece2(s: [int], e: int) -> bool:
    return e in s

def pertenece3(s: [int], e: int) -> bool: ## revisar #no tendria que ir porque no podemos modificar el valor de entrada
    print(s, e)
    if not s:
        print("aca")
        return False

    if e != s.pop():
        pertenece3(s, e)

    else:
        return True

def pertenece4(s, e) -> bool:
    return e in s
##2
def divide_a_todos(s: [int], e: int) -> bool:
    if not s:
        return False ## aunque depende de como lo interpretas el tema de la lista vacia
    
    for i in s:
        if (i % e != 0):
            return False
    
    return True

##3
def suma_total(s: [int]) -> int:
    res: int = 0

    for i in s:
        res += i
    
    return res

##4
def ordenados(s: [int]) -> bool:
    for i in range(0 , len(s) - 1):
        if (s[i] > s[i + 1]):
            return False
    
    return True

##5
def alguna_con_mas_de_7_caracteres(s: [str]) -> bool:
    for i in s:
        if (len(i) > 7): return True
    else:
        return False
    
##6
def texto_palindromo(texto: str) -> bool:
    char_num = len(texto)
    for i in range(0, round(char_num / 2)): #itera HASTA (no inclusive) el ultimo valor
        if (texto[i] != texto[char_num - 1 - i]): return False

    else:
        return True
    
##7
def analizar_contraseña(contraseña: str) -> str: #no puedo hacer una funcion mas fea
    tiene_mayus = False
    tiene_minus = False
    tiene_num = False
    long_may_8 = False
    long_men_5 = False

    if len(contraseña) >= 8:
        long_may_8 = True
    elif len(contraseña) < 5:
        long_men_5 = True
    else:
        pass

    for caracter in contraseña: #obviamente podes checkear listas prearmadas con los caracteres, pero no pienso hacer lista con todas las letras
        print(caracter)
        if caracter.islower(): #o tambien   strin.ascii_letters, string.ascii_lowecase, etc.
            tiene_minus = True
        elif caracter.isupper():
            tiene_mayus = True
        elif isinstance(int(caracter), int):
            tiene_num = True

    if tiene_mayus and tiene_minus and tiene_num and long_may_8:
        return "VERDE"
    elif long_men_5:
        return "ROJO"
    else:
        return "AMARILLO"

#8
def historial_de_movimientos(movimientos:[(str, float)]) -> float:
    saldo: float = 0
    for transaccion in movimientos:
        tipo_de_trans = transaccion[0]
        monto = transaccion[1]

        if tipo_de_trans == "I":
            saldo += monto
        else:
            saldo -= monto
    
    return saldo

test_movimientos1 = [("I", 200),("I", 200),("I", 200),("I", 200),("I", 200),("R", 1000)] #should be 0
test_movimientos2 = [("I", 200),("I", 200),("R", 1000)]

##devuelve none cuando quiero imprimir una funcion que no devuelve nada
print(
    historial_de_movimientos(test_movimientos1),
    historial_de_movimientos(test_movimientos2)
)