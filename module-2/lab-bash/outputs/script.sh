#!/bin/bash

##Ejercicios!!!

# Imprime en consola `Hello World`:
#echo "Hello World"

# Crea un directorio nuevo llamado `new_dir`:
#mkdir 'new_dir'

# Elimina ese directorio:
#rmdir 'new_dir'

# Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy:
#cp ../lorem/sed.txt ../lorem-copy

# Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`:
#cp ../lorem/*.txt ../lorem-copy

# Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem:
#cat '../lorem-copy/sed.txt'

# Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem:
#cat ../lorem-copy/at.txt ../lorem-copy/lorem.txt

# Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy:
#head -3 ../lorem-copy/sed.txt

# Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy:
#tail -3 ../lorem-copy/sed.txt

# Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy:
#echo 'Homo homini lupus.' >> ../lorem-copy/sed.txt

# Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus`:
#tail -3 ../lorem-copy/sed.txt

# Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`:
#sed 's/et/ET/' ../lorem-copy/at.txt

# Encuentra al usuario activo en el sistema:
#who

# Encuentra dónde estás en tu sistema de ficheros:
#pwd

# Lista los archivos que terminan por `.txt` en la carpeta lorem:
#ls ../lorem/*.txt

# Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem:
#wc -l ../lorem/sed.txt

# Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos:
#find '../' -name lorem* -type f | wc -l

# Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem:
#grep -r 'et' ../lorem/at.txt 

# Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem:
#grep -o 'et' ../lorem/at.txt | wc -l

# Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy:
#grep -o 'et' ../lorem-copy/* | wc -l

##BONUS

# Almacena en una variable `name` tu nombre:
#name='Isa'

# Imprime esa variable:
#echo $name

# Crea un directorio nuevo que se llame como el contenido de la variable `name`:
#mkdir 'isa'

# Elimina ese directorio:
#rmdir 'isa'

# Por cada archivo dentro de la carpeta `lorem` imprime el número de carácteres que tienen sus nombres. 
# Intenta primero mostrar los archivos mediante un bucle for:
#ls ../lorem/
#for file in $(ls ../lorem/)
#do
#fn=${file%.*}
#echo ${fn} 'has' ${#fn} 'characters length'
#done 

# Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:
#top
#ps -l

# Muestra información sobre tu procesador por pantalla: 
#sysctl -n machdep.cpu.brand_string

# Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz:
#tar -cf lorem-compressed.tar.gz ../lorem/ ../lorem-copy/

# Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed:
#mkdir lorem-uncompressed
#tar -xvf lorem-compressed.tar.gz