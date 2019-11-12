#!/bin/bash

#* Imprime en consola `Hello World`.
$echo "hello world"

#Crea un directorio nuevo llamado `new_dir`.
$mkdir "new_dir"
$ls 
    #returns: exercices  inputs  lorem  lorem-copy  new_dir  outputs  README.md

#Elimina ese directorio.
$rmdir "new_dir"
$ls 
    #returns: exercices  inputs  lorem  lorem-copy  outputs  README.md

#Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy. 
$mv lorem/sed.txt lorem-copy

#Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`. 
$mv lorem/lorem.txt lorem/at.txt lorem-copy

#Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.
$cat lorem/sed.txt

#Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem. 
$cat lorem/at.text

#Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
$cat lorem/at.txt lorem/lorem.txt

#Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
$tail -n 3 lorem/sed.txt

#Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy. 
$echo "Homo homini lupus." >> lorem-copy/sed.txt

#Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`. 
$tail -n 3 lorem-copy/sed.txt

#Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`. 
$sed -i 's/et/ET/g' lorem-copy/at.txt

#Encuentra al usuario activo en el sistema.
$w

#Encuentra dónde estás en tu sistema de ficheros.
$

#Lista los archivos que terminan por `.txt` en la carpeta lorem.
$

#Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem. 
$

#Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.
$

#Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.
$

#Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem. 
$

#Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy. 
$