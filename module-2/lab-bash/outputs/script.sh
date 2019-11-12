#!/bin/bash

##Ejercicios!!!

# Ejercicio 1
#echo "Hello World"

# Ejercicio 2
#mkdir 'new_dir'

# Ejercicio 3
#rmdir 'new_dir'

# Ejercicio 4
#cp ../lorem/sed.txt ../lorem-copy

# Ejercicio 5
#cp ../lorem/*.txt ../lorem-copy

# Ejercicio 6
#cat '../lorem-copy/sed.txt'

# Ejercicio 7
#cat ../lorem-copy/at.txt ../lorem-copy/lorem.txt

# Ejercicio 8
#head -3 ../lorem-copy/sed.txt

# Ejercicio 9
#tail -3 ../lorem-copy/sed.txt

# Ejercicio 10
#echo 'Homo homini lupus.' >> ../lorem-copy/sed.txt

# Ejercicio 11
#tail -3 ../lorem-copy/sed.txt

# Ejercicio 12
#sed 's/et/ET/' ../lorem-copy/at.txt

# Ejercicio 13
#who

# Ejercicio 14
#pwd

# Ejercicio 15
#ls ../lorem/*.txt

# Ejercicio 16
#wc -l ../lorem/sed.txt

# Ejercicio 17
#find '../' -name lorem* -type f | wc -l

# Ejercicio 18
#grep -r 'et' ../lorem/at.txt 

# Ejercicio 19
#grep -o 'et' ../lorem/at.txt | wc -l

# Ejercicio 20
#grep -o 'et' ../lorem-copy/* | wc -l

##BONUS
name='Isa'
#echo $name
#mkdir 'isa'
#rmdir 'isa'
ls ../lorem/
for file in $(ls ../lorem/)
do
fn=${file%.*}
echo ${fn} 'has' ${#fn} 'characters length'
done 
