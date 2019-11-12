#!/bin/bash

#Ej 1
    #echo 'Hello World!'

# EJ 2
    #mkdir new_dir

# EJ 3

    #rmdir new_dir

# EJ 4

    #cp ../lorem/sed.txt ../lorem-copy

# EJ 5
    #cp ../lorem/at.txt ../lorem-copy; cp ../lorem/lorem.txt ../lorem-copy

# EJ 6
    #cat ../lorem/sed.txt

# EJ 7
    #cat ../lorem/at.txt ; cat ../lorem/lorem.txt

# EJ 8
    #head -n3 ../lorem-copy/sed.txt

# EJ 9
    #tail -n3 ../lorem-copy/sed.txt

# EJ 10
    #tail -n 3 ../lorem-copy/sed.txt | echo ' Homo homini lupus.' 

#EJ 11
    #tail -n 0 ../lorem-copy/sed.txt

# EJ 12
    #sed  's/ et / ET /' ../lorem-copy/at.txt

# EJ 13
    #id -u   NO SE SI ES CORRECTO, ME SALE UN NUMERO.

# EJ 14
    #pwd

# EJ 15

    # find ../lorem -name "*.txt"

# EJ 16

    #wc -l ../lorem/sed.txt


# EJ 17

    # find lorem . | wc -l


# EJ 18

    #grep -n et ../lorem/at.txt

# EJ 19


    #cat ../lorem/at.txt | grep -wo et | wc -w


# EJ 20
find . -type f -exec grep -o et {} \; | wc -l