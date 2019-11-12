#!/bin/bash

## Imprime en consola Hello World.
#echo 'Hello World'

## Crea un directorio nuevo llamado new_dir.
#mkdir new_dir

## Elimina ese directorio.
#rm -r new_dir

## Copia el archivo sed.txt dentro de la carpeta lorem a la carpeta lorem-copy.
#cp "../lorem/sed.txt" "../lorem-copy"

## Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante ;.
#cp "../lorem/lorem.txt" "../lorem-copy";cp "../lorem/at.txt" "../lorem-copy"

## Muestra el contenido del archivo sed.txt dentro de la carpeta lorem.
#cat "../lorem/sed.txt"
#less "../lorem/sed.txt"

## Muestra el contenido de los archivos at.txt y lorem.txt dentro de la carpeta lorem.
#cat "../lorem/lorem.txt" "../lorem/at.txt"

##Visualiza las primeras 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
#head -n 3 "../lorem-copy/sed.txt"

## Visualiza las ultimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
#tail -3 "../lorem-copy/sed.txt"

## Añade Homo homini lupus. al final de archivo sed.txt dentro de la carpeta lorem-copy.
#echo "Homo homini lupus" >> "../lorem-copy/sed.txt"

## Visualiza las últimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy. Deberías ver ahora Homo homini lupus..
#tail -3 "../lorem-copy/sed.txt"

## Sustituye todas las apariciones de et por ET del archivo at.txt dentro de la carpeta lorem-copy. Deberás usar sed.
#sed 's/et/ET/g' "../lorem-copy/at.txt"

## Encuentra al usuario activo en el sistema.
#who
#cat /etc/passwd

## Encuentra dónde estás en tu sistema de ficheros.
#pwd

## Lista los archivos que terminan por .txt en la carpeta lorem.
#ls ../lorem/*txt

## Cuenta el número de líneas que tiene el archivo sed.txt dentro de la carpeta lorem.
#cat "../lorem/sed.txt" | wc -l

## Cuenta el número de archivos que empiezan por lorem que están en este directorio y en directorios internos.
#find '../' -name 'lorem*' -type f | wc -l

## Encuentra todas las apariciones de et en at.txt dentro de la carpeta lorem.
#grep -o "et" "../lorem/at.txt"

## Cuenta el número de apariciones del string et en at.txt dentro de la carpeta lorem.
#grep -o "et" "../lorem/at.txt" | wc -l

## Cuenta el número de apariciones del string et en todos los archivos del directorio lorem-copy.
#grep -o "et" ../lorem-copy/*txt | wc -l

##BONUS
# Almacena en una variable name tu nombre.
#name='Maika'

# Imprime esa variable.
#echo $name

#Crea un directorio nuevo que se llame como el contenido de la variable name.
#mkdir $name

# Elimina ese directorio.
#rm -r $name

# Por cada archivo dentro de la carpeta lorem imprime el número de carácteres que tienen sus nombres. Intenta primero mostrar los archivos mediante un bucle for

    #Imprime los ficheros
    #Imprime las longitudes de los nombres de los ficheros
    #Imprime outputs con la siguiente estructura: lorem has 5 characters lenght
#ls ../lorem/
#ls "../lorem/" | wc -l
#for e in $(ls ../lorem/)
#do
#fn=${e%.*}
#echo $fn ‘has’ ${#fn} ‘characters length’
#done
# Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:

    #Usando el comando top o htop
    #Usando el comando ps con argumentos
#top
#ps -s

# Muestra información sobre tu procesador por pantalla
#cat /proc/cpuinfo

# Crea 3 alias y haz que estén disponibles cada vez que inicias sesión
#no lo hago en mi inicio de sesion para que no de la lata...pero es asi, con 3 cosas
#alias actualizar=`sudo apt-get update`

#Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz
#tar -czvf lorem-compressed.tar.gz ../lorem/ ../lorem-copy/

#Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed
#tar -xzvf lorem-compressed.tar.gz