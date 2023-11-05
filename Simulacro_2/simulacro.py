s1 = [-1, 4, 0, 4, 100, 0, 100, 0, -1, -1]
e1 = 0

def ultima_aparicion(s:[int], e: int) -> int:
    # res es la posicion de la ultima aparicionde e en s
    # e pertenece a s
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

#print(elementos_exclusivos(s2, t2))

def contar_traducciones_iguales(ing: dict, ale: dict) -> int:
    # res = cantidad de palabras que están en ambos diccionarios y ademas tienen igual valor en ambos
    d_mas_claves: dict = None
    d_menos_claves: dict = None
    contador: int = 0
    if ing.keys() > ale.keys():
        d_mas_claves = ing
        d_menos_claves = ale
    else:
        d_mas_claves = ale
        d_menos_claves = ing

    for key in d_mas_claves:
        if key in d_menos_claves.keys():
            if d_mas_claves[key] == d_menos_claves[key]:
                contador += 1
    
    return contador

aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
ingles = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

#print(contar_traducciones_iguales(aleman, ingles))

def convertir_a_diccionario(l: [int]) -> dict[int, int]:
    # res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en la lista.
    d: dict[int, int] = {}

    for elem in l:
        if not elem in d.keys():
            d[elem] = 1
        else:
            d[elem] += 1

    return d

l = [-1, 0, 4, 100, -1, -1]
print(convertir_a_diccionario(l))