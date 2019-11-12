#!/bin/bash

# ex1: print "hello world"  (using in therminal the command cat+filename)
#   echo $"Hello World"

# ex2: create a new directory 
#   mkdir new_dir in terminal

# ex3: remove new directory
#   rm -d new_dir

# ex4 Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy. 
#   cp ../lorem/sed.txt ../lorem-copy/    

#ex5 Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`. 
'''
No aparece en el help el ";" . Buscar mejor luego
'''
#   cp ../lorem/* ../lorem-copy/


# ex6 Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.
#   cat ../lorem/sed.txt 


#ex7 Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem.
#   cat ../lorem/sed.txt | cat ../lorem/at.txt


#ex8 Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
#    head -n3 ../lorem-copy/sed.txt 


#ex9 Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy
#   tail -3 ../lorem-co


#ex10 Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy. 
#   echo "Homo homini lupus" >> ../lorem-copy/sed.txt 


#ex11 Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`. 
# done. lo de tail citado anteriormente


#ex12 Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`. 
#   sed -i 's/et/ET/' ../lorem-copy/at.txt      

#ex13 Encuentra al usuario activo en el sistema.
#   who -H


#ex14 Encuentra dónde estás en tu sistema de ficheros.
#   pwd


#ex15 Lista los archivos que terminan por `.txt` en la carpeta lorem.
#   ls ../lorem/*.txt


#ex16 Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem. 
#   wc -l ../lorem/sed.txt  


#ex17 Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.
#   ls -dq ../**lorem** |wc -l


#ex18 Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.
#   grep -i "et" ../lorem/at.txt 


#ex19 Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem. 
#   less ../lorem/at.txt | grep -c "et"


#ex20  Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy. 
#   grep -s "et" ../* .*


## Ficheros bash

#Manual vi: https://www.howtogeek.com/102468/a-beginners-guide-to-editing-text-files-with-vi/

#Cualquier comando o comandos de bash se pueden almacenar en un fichero y ejecutar cuando queramos. 
#Obviamente puedes utilizar tu editor preferido. Creamos el fichero: 
```
$ vi list_files.sh
```

#E incluimos el contenido que queramos. En este caso listar ficheros:
```bash
!/bin/bash
ls
```

#Ejecutamos el script:
```
$ bash list_files.sh
```

#Y veremos por consola el siguiente output. 
```console
exercices  inputs  lorem  lorem-copy  modules  outputs  README.md
```

## Bonus

#* Almacena en una variable `name` tu nombre.

#* Imprime esa variable.

#* Crea un directorio nuevo que se llame como el contenido de la variable `name`.

#* Elimina ese directorio. 

#* Por cada archivo dentro de la carpeta `lorem` imprime el número de carácteres que tienen sus nombres. 
#Intenta primero mostrar los archivos mediante un bucle for 
#    1. Imprime los ficheros
#    2. Imprime las longitudes de los nombres de los ficheros
#    3. Imprime outputs con la siguiente estructura: `lorem has 5 characters lenght`

#* Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:
#    1. Usando el comando top o htop
#       top -n10

#    2. Usando el comando ps con argumentos
#       ps -A
#       ps -e

#* Muestra información sobre tu procesador por pantalla

#* Crea 3 alias y haz que estén disponibles cada vez que inicias sesión

#* Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz

#* Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed
