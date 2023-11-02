s1 = [-1, 4, 0, 4, 100, 0, 100, 0, -1, -1]
e1 = 0

def ultima_aparicion(s:[int], e: int) -> int:
    # e pertenece a s
    # res es la posicion de la ultima aparicionde e en s
    for i in range(len(s) - 1, -1, -1):
        if e == s[i]:
            return i
        
#print(ultima_aparicion(s1, e1))
def eliminar_repetidos(s:list) -> list:
    elem_d: dict = {}
    sin_repetir: list = []
    for elem in s:
        if not elem in elem_d.keys():
            elem_d[elem] = 1

    for key in elem_d:
        sin_repetir.append(key)

    return sin_repetir

def elementos_exclusivos(s:[int], t:[int]) -> [int]:
    #asegura res tiene todos los elementos que pertenecen o bien a s o bien a t, pero no ambas
    # asegura res no tiene elementos repetidos
    elementos_en_ambas: [int] = []
    union_st: [int] = s + t
    res: [int] = []
    for elem in s:
        if elem in t:
            elementos_en_ambas.append(elem)

    print(elementos_en_ambas)
    for elem1 in union_st:
        print(elem1)
        if not elem1 in elementos_en_ambas:
            res.append(elem1)

    return eliminar_repetidos(res)

s2 = [1,1,1,2,3,4,4,5,6,9,9,8]
t2 = [5,6,7,8,8,8]

print(elementos_exclusivos(s2, t2))
