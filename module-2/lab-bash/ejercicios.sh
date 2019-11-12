#!/bin/bash

#Imprime en consola Hello World.
#echo 'Hello World'

#Crea un directorio nuevo llamado new_dir.
#mkdir new_dir

#Elimina ese directorio.
#rmdir new_dir

#Copia el archivo sed.txt dentro de la carpeta lorem a la carpeta lorem-copy.
#cp lorem/sed.txt lorem-copy/

#Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante ;.
#cp lorem/{at.txt,lorem.txt} lorem-copy/

#Muestra el contenido del archivo sed.txt dentro de la carpeta lorem.
#cat lorem/sed.txt

#Muestra el contenido de los archivos at.txt y lorem.txt dentro de la carpeta lorem.
#cat lorem/at.txt | cat lorem/lorem.txt

#Visualiza las primeras 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
#head -n 3 lorem-copy/sed.txt

#Visualiza las ultimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
#tail -n 3 lorem-copy/sed.txt

#Añade Homo homini lupus. al final de archivo sed.txt dentro de la carpeta lorem-copy.
#echo 'Homo homini lupus' >> lorem-copy/sed.txt

#Visualiza las últimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy. Deberías ver ahora Homo homini lupus..
#tail -n 3 lorem-copy/sed.txt

#Sustituye todas las apariciones de et por ET del archivo at.txt dentro de la carpeta lorem-copy. Deberás usar sed.
#sed -i -e 's/et/ET/g' lorem-copy/at.txt

#Encuentra al usuario activo en el sistema.
#w
#who | cut -d' ' -f1 | sort | uniq
#whoami

#Encuentra dónde estás en tu sistema de ficheros.
#pwd

#Lista los archivos que terminan por .txt en la carpeta lorem.
#ls lorem/*.txt

#Cuenta el número de líneas que tiene el archivo sed.txt dentro de la carpeta lorem.
#wc -l lorem/sed.txt
#repasar

#Cuenta el número de archivos que empiezan por lorem que están en este directorio y en directorios internos.
#ls -dq **lorem** | wc -l

#Encuentra todas las apariciones de et en at.txt dentro de la carpeta lorem.
#grep -o 'et' lorem/at.txt

#Cuenta el número de apariciones del string et en at.txt dentro de la carpeta lorem.
#grep -o 'et' lorem/at.txt | wc -l

#Cuenta el número de apariciones del string et en todos los archivos del directorio lorem-copy.
#grep -o 'et' lorem-copy/*.txt | wc -l

#------
#Bonus

#Almacena en una variable name tu nombre.
#NAME="Ovi"

#Imprime esa variable.
#echo $NAME

#Crea un directorio nuevo que se llame como el contenido de la variable name.
#mkdir $NAME

#Elimina ese directorio.
#rmdir $NAME

#Por cada archivo dentro de la carpeta lorem imprime el número de carácteres que tienen sus nombres. Intenta primero mostrar los archivos mediante un bucle for


#Imprime los ficheros
    #No consigo que sean solo los ficheros, me lo cuenta como lorem/at.txt y además no sé como cuenta
#for VARIABLE in lorem/*
#do
#    echo on $VARIABLE
#done


#Imprime las longitudes de los nombres de los ficheros
    # En este se ve mejor mi duda, por ejemplo cuenta 15 para lorem/at.txt y yo cuento 12
#for VARIABLE in lorem/*
#do
#    echo on $VARIABLE | awk '{print length}'
#done

#Imprime outputs con la siguiente estructura: lorem has 5 characters lenght
#for VARIABLE in lorem/*
#do
#    echo on $VARIABLE | awk '{print $VARIABLE " has " length($VARIABLE) " characters lenght"}'
#done

#Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:

#Usando el comando top o htop
#top -n 10
#Usando el comando ps con argumentos
#ps -ef | less
#Muestra información sobre tu procesador por pantalla
#lscpu

#Crea 3 alias y haz que estén disponibles cada vez que inicias sesión
#comprobar si en:
#gedit ~/.bashrc  tenemos:
    #if [ -f ~/.bash_aliases ]; then
    #. ~/.bash_aliases
    #fi
#añadir al final del ~/.bashrc los alias:
    # alias name1='Obi'
    # alias name2='Wan'
    # alias lastname='Kenobi'

#Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz
#tar -czvf lorem-compressed.tar.gz lorem/* lorem-copy/*

#Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed
#tar xvzf lorem-compressed.tar.gz --one-top-level






