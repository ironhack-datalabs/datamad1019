#!/bin/bash

#chmod u+x

# Imprime en consola `Hello World`.
#echo Hello World

# Crea un directorio nuevo llamado `new_dir`.
#mkdir new_dir

# Elimina ese directorio.
#rmdir new_dir

# Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy. 
#cp lorem/sed.txt lorem-copy

# Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`.
#cp lorem/{at.txt,lorem.txt} lorem-copy

# Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.
#cat lorem/sed.txt

#Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem.
#cat lorem/at.txt
#cat lorem/lorem.txt

#Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy
#head -n3 lorem-copy/sed.txt

#Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy
#tail -3 lorem-copy/sed.txt

#Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy.
#echo 'Homo homini lupus.'>>lorem-copy/sed.txt

#Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`. 
#tail -3 lorem-copy/sed.txt

#Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`.
#sed -i 's/et/ET/g' lorem-copy/at.txt

#Encuentra al usuario activo en el sistema.
#whoami
#id
#w

#Encuentra dónde estás en tu sistema de ficheros.
#pwd

#Lista los archivos que terminan por `.txt` en la carpeta lorem.
#ls lorem/*.txt

#Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem. 
#wc -l lorem/sed.txt

#Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.
#ls /home/guzman/Documentos/IRONHACK/datamad1019/module-2/lab-bash | grep  'lorem*' | wc -l

#Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.
#grep -r 'et' lorem/at.txt

# Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem.
#grep -o ' et ' lorem/at.txt | wc -l

#Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy.
#cat lorem-copy/* | grep -o 'et'

#Almacena en una variable `name` tu nombre.
#nombre='Guzmán'

#Imprime esa variable.
#echo $nombre

#Crea un directorio nuevo que se llame como el contenido de la variable `name`.
#mkdir "$nombre"

#Elimina ese directorio.
#rmdir "$nombre"

#Por cada archivo dentro de la carpeta `lorem` imprime el número de carácteres que tienen sus nombres. 
#1. Imprime los ficheros
#ls lorem/*

#2. Imprime las longitudes de los nombres de los ficheros
#for f in lorem/*; do echo ${#f}; done

for f in lorem/*; do echo lorem/1 has ${#f} characters lenght; done