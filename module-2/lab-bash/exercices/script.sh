#!/bin/bash

#Ejercicio 1
#echo 'Hello World'

#Ejercicio 2
#mkdir new_dir

#Ejercicio 3
#rm -R new_dir

#Ejercicio 4
#cp -i ../lorem/sed.txt ../lorem-copy

#Ejercicio 5
#cp -i ../lorem/at.txt ../lorem-copy;cp -i ../lorem/lorem.txt ../lorem-copy

#Ejercicio 6
#cat ../lorem/sed.txt

#Ejercicio 7
#cat ../lorem/at.txt;cat ../lorem/lorem.txt

#Ejercicio 8
#head -n3 ../lorem-copy/sed.txt

#Ejercicio 9
#tail -n3 ../lorem-copy/sed.txt

#Ejercicio 10
#echo 'homo homini lupus' >> ../lorem-copy/sed.txt

#Ejercicio 11
#tail -n3 ../lorem-copy/sed.txt

#Ejercicio 12
#sed -i 's/et/ET/g' ../lorem-copy/at.txt

#Ejercicio 13
#who | awk '{print $1}' | sort

#Ejercicio 14
#pwd

#Ejercicio 15
#find ../lorem -type f -name "*.txt"

#Ejercicio 16
#wc -l ../lorem/sed.txt

#Ejercicio 17
#find ../ -name 'lorem*' | wc -l

#Ejercicio 18
#grep -o 'et' ../lorem/at.txt

#Ejercicio 19
#grep -o 'et' ../lorem/at.txt | wc -l

#Ejercicio 20
#grep -r 'et' '../lorem-copy/' | wc -l

####BONUS
#1
#name="JOAQUIN"
#2
#echo "$name"
#3
#mkdir $name
#4
#rmdir $name
#5
for file in $(ls ../lorem);
do
fn=${file%.*}
echo ${fn} 'has' ${#fn} 'characthers length'
done