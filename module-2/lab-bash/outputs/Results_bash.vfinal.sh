#EXERCISE 1
#Imprime en consola Hello World

echo Hello World

#EXERCISE 2
#Crea un directorio nuevo llamado new_dir.

mkdir new_dir

#EXERCISE 3
#Elimina ese directorio.

rm -r new_dir

#EXERCISE 4
#Copia el archivo sed.txt dentro de la carpeta lorem a la carpeta lorem-copy

cp lorem/sed.txt lorem-copy

#EXERCISE 5
#Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante ;

cp lorem/at.txt lorem-copy ; cp lorem/lorem.txt lorem-copy

#EXERCISE 6
#Muestra el contenido del archivo sed.txt dentro de la carpeta lorem.

cat ./lorem/sed.txt

#EXERCISE 7
#Muestra el contenido de los archivos at.txt y lorem.txt dentro de la carpeta lorem.

cat "./lorem/at.txt" "./lorem/lorem.txt"

#EXERCISE 8
#Visualiza las primeras 3 líneas del archivo sed.txt dentro de la carpeta lorem-cop

head -n 3 "./lorem-copy/sed.txt"

#EXERCISE 9
#Visualiza las ultimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy

tail -n 3 "./lorem-copy/sed.txt"

#EXERCISE 10
#Añade Homo homini lupus. al final de archivo sed.txt dentro de la carpeta lorem-copy.

printf "Homo homini lupus." >> "./lorem-copy/sed.txt"

#EXERCISE 11
#Visualiza las últimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy. Deberías ver ahora Homo homini lupus.

tail -n 3 "./lorem-copy/sed.txt"

#EXERCISE 12
#Sustituye todas las apariciones de et por ET del archivo at.txt dentro de la carpeta lorem-copy. Deberás usar sed.

sed -i 's/et/ET/g' lorem-copy/at.txt

#EXERCISE 13
#Encuentra al usuario activo en el sistema.

w

#EXERCISE 14
#Encuentra dónde estás en tu sistema de ficheros.
pwd

/Users/elenadlf/IRONHACKMADALL/datamad1019/module-2/lab-bash

#EXERCISE 15    
#Lista los archivos que terminan por .txt en la carpeta lorem

ls ./lorem/*txt

#EXERCISE 16
#Cuenta el número de líneas que tiene el archivo sed.txt dentro de la carpeta lorem.

wc -l ./lorem/sed.txt

#EXERCISE 17
#Cuenta el número de archivos que empiezan por lorem que están en este directorio y en directorios internos.

ls lorem* | wc -l

#EXERCISE 18
#Encuentra todas las apariciones de et en at.txt dentro de la carpeta lorem

grep 'et' ./lorem/at.txt

#EXERCISE 19
#Cuenta el número de apariciones del string et en at.txt dentro de la carpeta lorem.

grep -o 'et' ./lorem-copy/* | wc -l

#EXERCISE 20
#Cuenta el número de apariciones del string et en todos los archivos del directorio lorem-copy.

grep -o 'et' ./lorem-copy/* | wc -l














