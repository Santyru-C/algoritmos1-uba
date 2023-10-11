### PARAMETROS
LISTA_NUM1 = [1,2,3,4,5]
LISTA_NUM2 = [2,4,6,8,10]

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

def pertenece3(s: [int], e: int) -> bool: ## revisar
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

print(
    suma_total(LISTA_NUM1),
    suma_total(LISTA_NUM2),
    suma_total([])
)