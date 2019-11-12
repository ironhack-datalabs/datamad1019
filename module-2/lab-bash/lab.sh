#!/bin/bash

#Imprime en consola `Hello World`.
#echo "Hello World!"

#Crea un directorio nuevo llamado `new_dir`.
#mkdir new_dir

#Elimina ese directorio.
#rm -d new_dir

#Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy.
#cp ./lorem/sed.txt ./lorem-copy

#Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`.
#cp ./lorem/{lorem.txt,at.txt} ./lorem-copy

#Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.
#cat ./lorem/sed.txt

#Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem. 
#cat ./lorem/{lorem.txt,at.txt}

#Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
#head -3 ./lorem-copy/sed.txt

#Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
#tail -3 ./lorem-copy/sed.txt

# Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy. 
#echo "Homo homini lupus" >> ./lorem-copy/sed.txt

# Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`. 
#head -3 ./lorem-copy/sed.txt

# Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`.
#sed -i 's/et/ET/g' ./lorem-copy/at.txt

# Encuentra al usuario activo en el sistema.
#w

# Encuentra dónde estás en tu sistema de ficheros.
#pwd

# Lista los archivos que terminan por `.txt` en la carpeta lorem.
#find ./lorem -name "*.txt"

# Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem. 
#wc -l ./lorem/sed.txt

# Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.
#find ./ -name "lorem*" -type f

# Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.
# grep "et" --color=auto -n ./lorem/at.txt

# Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy.  
# grep -o "et" ./lorem/at.txt | wc -l

# Almacena en una variable `name` tu nombre.
# nombre=Jorge

# Imprime esa variable.
# echo $nombre

# Crea un directorio nuevo que se llame como el contenido de la variable `name`.
# mkdir $nombre

# Elimina ese directorio. 
# rm -d $nombre

def files_lorem():
    files_found = find ./lorem -name "*.txt"
    for e in files_found:
        print("{} has {} characters lenght.".format(e, len(e))