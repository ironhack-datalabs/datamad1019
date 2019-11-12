#Ejercicio 1: Imprime en consola `Hello World`.
#echo Hello world

#Ejercicio 2: Crea un directorio nuevo llamado `new_dir`
#mkdir new_dir
#ls

#Ejercicio 3:  Elimina ese directorio:
#rmdir new_dir
#ls

#Ejercico 4: Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy. 

#cp -r lorem/sed.txt lorem-copy/

#Ejercico 5: Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola línea mediante `;`. 

#cp lorem/{at.txt,lorem.txt} lorem-copy/

#Ejercico 6: Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.

#cat lorem/sed.txt

#Ejercico 7: Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem. 

#cat lorem/{at.txt,lorem.txt}

#Ejercico 8: Visualiza las primeras 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 
 
#sed '1,3!d' lorem-copy/sed.txt
#head  -3 lorem-copy/sed.txt

#Ejercico 9: Visualiza las ultimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy 

#sed '7,9!d' lorem-copy/sed.txt
#tail -3 lorem-copy/sed.txt

#Ejercico 10: Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy. 

#echo 'Homo homini lupus.' >> lorem-copy/sed.txt

#Ejercico 11: Visualiza las últimas 3 líneas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`. 

#sed '7,9!d' lorem-copy/sed.txt
#tail -3 lorem-copy/sed.txt

#Ejercico 12: Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem-copy. Deberás usar `sed`. 

#sed -i -e 's/et/ET/g' lorem-copy/at.txt


#Ejercico 13: Encuentra al usuario activo en el sistema.

#w

#Ejercico 14: Encuentra dónde estás en tu sistema de ficheros.

#pwd

#Ejercico 15: Lista los archivos que terminan por `.txt` en la carpeta lorem.

#find lorem/ -name "*.txt"

#Ejercico 16: Cuenta el número de líneas que tiene el archivo `sed.txt` dentro de la carpeta lorem. 

#wc -l lorem/sed.txt

#Ejercico 17: Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos.

#find . -name  'lorem*' -maxdepth 1 | wc -l
#ls -dq **lorem** | wc -l

#Ejercico 18: Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.

#grep et lorem/at.txt

#Ejercico 19: Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem. 

#grep  -o et lorem/at.txt| wc -l

#Ejercico 20:  Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy.

#grep -o et lorem-copy/*  | wc -l