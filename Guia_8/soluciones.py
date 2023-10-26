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

agregar_frase("test", "lalallalal")