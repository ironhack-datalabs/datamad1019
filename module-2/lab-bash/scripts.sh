#!/bin/bash
# Ej 1: Imprime en consola `Hello World`.
    #SALUDO="Hello World"
    #echo $SALUDO

# Ej 2: Crea un directorio nuevo llamado `new_dir`.
    #mkdir new_dir

# Ej 3: Elimina ese directorio.
    #rmdir new_dir

# Ej 4: Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy.
    #cp ./lorem/sed.txt lorem-copy

# Ej 5: Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`.
    #cp ./lorem/lorem.txt lorem-copy;cp ./lorem/at.txt lorem-copy

# Ej 6: Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.
    #cat ./lorem/sed.txt 

# Ej 7: Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem.
    #cat ./lorem/at.txt ; cat ./lorem/lorem.txt

# Ej 8: Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy.
    #head -3 ./lorem-copy/sed.txt

# Ej 9: Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy.
    #tail -3 ./lorem-copy/sed.txt

# Ej 10: Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy.
    #echo "Homo homini lupus." >> ./lorem-copy/sed.txt

# Ej 11: Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`.
    #sed 's,et,ET,g' ./lorem-copy/at.txt

# Ej 12: Encuentra al usuario activo en el sistema.
    #who

# Ej 13: Encuentra dónde estás en tu sistema de ficheros.
    #pwd

# Ej 14: Lista los archivos que terminan por `.txt` en la carpeta lorem.
    #ls ./lorem/*txt

# Ej 15: Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem.
    #wc -l ./lorem/sed.txt

# Ej 16: Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.
    #find lorem | wc -l

# Ej 17: Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.
    #grep "et" ./lorem/at.txt

# Ej 18: Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem.
    #grep -c "et" ./lorem/at.txt

# Ej 19: Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy.
    #cat ./lorem-copy/* | grep -c -o "et" 

# Bonus: 

# Almacena en una variable `name` tu nombre.
    #NAME="David"
# Imprime esa variable.
    #echo $NAME
# Crea un directorio nuevo que se llame como el contenido de la variable `name`. 
    #mkdir "$NAME"
# Elimina ese directorio.
    #rmdir "$NAME"
# Por cada archivo dentro de la carpeta `lorem` imprime el número de carácteres que tienen sus nombres. 
    #Intenta primero mostrar los archivos mediante un bucle for 
    #    1. Imprime los ficheros
    #    2. Imprime las longitudes de los nombres de los ficheros
    #    3. Imprime outputs con la siguiente estructura: `lorem has 5 characters lenght`
    ./lorem 