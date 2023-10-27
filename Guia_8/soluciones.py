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
def promedio_estudiante(lu: str) -> float: #argumento de tipo in es el nr de libreta universitaria del estudiate del cual queremos saber el promedio
    formatted_data: [[str]] = []
    notas_alumno: [int] = []

    with open("notas.csv", "r") as archivo:
        raw_data: [str] = archivo.readlines()
        for line in raw_data:
            formatted_data.append(line.rstrip().split(","))

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

print(generar_numeros_al_azar(5,1,10)