#!/usr/bin/env sh

#####################################################################################################

# ./exercices/exercices.sh

# BASH LAB:

# Imprime en consola Hello World.
echo 'Hello World'

# Crea un directorio nuevo llamado new_dir.
mkdir new_dir

# Elimina ese directorio.
rmdir new_dir # rmdir works because the directory is empty. rm -r for directories with content.

# Copia el archivo sed.txt dentro de la carpeta lorem a la carpeta lorem-copy.
cp lorem/sed.txt lorem-copy

# Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante ;.
cp lorem/lorem.txt lorem/at.txt lorem-copy # cp lorem/* lorem-copy/ # ¿mediante punto y coma?

# Muestra el contenido del archivo sed.txt dentro de la carpeta lorem.
cat lorem/sed.txt

# Muestra el contenido de los archivos at.txt y lorem.txt dentro de la carpeta lorem.
cat lorem/at.txt <(echo) lorem/lorem.txt <(echo)

# Visualiza las primeras 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
head -3 lorem-copy/sed.txt

# Visualiza las ultimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy
tail -3 lorem-copy/sed.txt

# Añade Homo homini lupus. al final de archivo sed.txt dentro de la carpeta lorem-copy.
echo "Homo homini lupus" >> lorem-copy/sed.txt # No añade una nueva línea
# sed -i '$a Homo homini lupus' lorem-copy/sed.txt # Añade una nueva línea

# Visualiza las últimas 3 líneas del archivo sed.txt dentro de la carpeta lorem-copy. Deberías ver ahora Homo homini lupus..
tail -3 lorem-copy/sed.txt

# Sustituye todas las apariciones de et por ET del archivo at.txt dentro de la carpeta lorem-copy. Deberás usar sed.
sed -i -e 's/et/ET/g' lorem-copy/at.txt # in-place edit due to the -i option.

# Encuentra al usuario activo en el sistema.
whoami

# Encuentra dónde estás en tu sistema de ficheros.
pwd

# Lista los archivos que terminan por .txt en la carpeta lorem.
ls lorem | egrep '\.txt$'

# Cuenta el número de líneas que tiene el archivo sed.txt dentro de la carpeta lorem.
wc -l lorem/sed.txt # 8 líneas

# Cuenta el número de archivos que empiezan por lorem que están en este directorio y en directorios internos.
find . -type f -name "lorem*" | wc -l # 2

# Encuentra todas las apariciones de et en at.txt dentro de la carpeta lorem.
grep -o 'et' lorem/at.txt # lista todas las apariciones (incluye 'et' dentro de palabras y mayúsculas)

# Cuenta el número de apariciones del string et en at.txt dentro de la carpeta lorem.
grep -o 'et' lorem/at.txt | wc -l # 10 # cuenta las lineas en la lista de apariciones

# Cuenta el número de apariciones del string et en todos los archivos del directorio lorem-copy.
grep -o 'et' lorem-copy/* | wc -l # 7 (menos que antes porque hemos sustituido 'et' por 'ET' en at.txt en esta carpeta)

#####################################################################################################

# BONUS:

# Almacena en una variable name tu nombre.
NAME="Cris"

# Imprime esa variable.
echo $NAME

# Crea un directorio nuevo que se llame como el contenido de la variable name.
mkdir $NAME

# Elimina ese directorio.
rmdir $NAME

# Por cada archivo dentro de la carpeta lorem imprime el número de carácteres que tienen sus nombres.
# Intenta primero mostrar los archivos mediante un bucle for
# Imprime los ficheros
# Imprime las longitudes de los nombres de los ficheros
# Imprime outputs con la siguiente estructura: lorem has 5 characters lenght




# Muestra los procesos de forma jerárquica que se están ejecutando en tu ordenador:
# Usando el comando top o htop
# Usando el comando ps con argumentos

# No me van en windows y git bash. Lo he hecho en casa con linux.
# htop -t
# ps -aef --forest




# Muestra información sobre tu procesador por pantalla

# No me van en windows y git bash. Lo he hecho en casa con linux.
# lscpu




# Crea 3 alias y haz que estén disponibles cada vez que inicias sesión




# Comprime las carpetas lorem y lorem-copy en un archivo llamado lorem-compressed.tar.gz



# Descomprime el archivo lorem-compressed.tar.gz en la carpeta lorem-uncompressed


