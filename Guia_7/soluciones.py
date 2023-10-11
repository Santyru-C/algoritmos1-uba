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
print(
    divide_a_todos([2,4,6,8], 2),
    divide_a_todos([1,2,3,4], 2),
    divide_a_todos([], 1)
)