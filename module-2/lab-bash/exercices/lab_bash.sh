#!/bin/bash

# Ejercicio 1

#echo "Hello World"

# Ejercicio 2

# mkdir new_dir

# Ejercicio 3

# rmdir new_dir

# Ejercicio 4

# cp ../lorem/sed.txt ../lorem-copy/sed.txt

# Ejercicio 5

# cp ../lorem/lorem.txt ../lorem-copy/lorem.txt ; cp ../lorem/at.txt ../lorem-copy/at.txt

# Ejercicio 6

# cat ../lorem/sed.txt

# Ejercicio 7

# cat ../lorem/at.txt ;  cat ../lorem/lorem.txt

# Ejercicio 8

# head -3 ../lorem-copy/sed.txt

# Ejercicio 9

# tail -3 ../lorem-copy/sed.txt

# Ejercicio 10

# echo "Homo homini lupus." >> ../lorem-copy/sed.txt

# Ejercicio 11

# sed -i 's/et/ET/g' ../lorem-copy/at.txt

# Ejercicio 12

# whoami

# Ejercicio 13

# pwd

# Ejercicio 14

# ls -l ../lorem/*.txt

# Ejercicio 15

# cat ../lorem/sed.txt | wc -l

# Ejercicio 16

# find ../ -name "lorem*.txt" | wc -l

# Ejercicio 17

# grep -o 'et' ../lorem/at.txt

# Ejercicio 18

# grep -o 'et' ../lorem/at.txt | wc -l

# Ejercicio 19

# grep -o 'et' ../lorem/* | wc -l

###########################################
############## BONUS ######################
###########################################

# Ejercicio 1

# name='Mario'

# Ejercicio 2

# echo $name

# Ejercicio 3

# mkdir "$name"

# Ejercicio 4

# rmdir "$name"

# Ejercicio 5

# i)
#for f in $(ls ../lorem)
#do
#    echo $f 
#done

# ii)
#for f in $(ls ../lorem)
#do
#    echo ${#f}
#done

# iii)

#for f in $(ls ../lorem)
#do
#    chrlen=${#f}
#    printf "%s has %d characters length.\n" "${f}" $chrlen 
#done

# Ejercicio 6

# i)

# top

# ii)

# ps -ef

# Ejercicio 7

# cat /proc/cpuinfo 

# Ejercicio 8

# I must sudo nano ~/.bashrc and then add the aliases like "alias c=clear", for example.

# Ejercicio 9

#tar -czvf ../lorem-compressed.tar.gz ../lorem ../lorem-copy

# Ejercicio 10

# tar -xzvf ../lorem-compressed.tar.gz

