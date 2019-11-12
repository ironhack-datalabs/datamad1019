#Ejercicio 1
echo "Hello World"

#Ejercicio 2
#mkdir new_dir

#Ejercicio 3
#rmdir new_dir

#Ejercicio 4
#cp ../lorem/sed.txt ../lorem-copy

#Ejercicio 5
#cp ../lorem/*.txt ../lorem-copy

#Ejercicio 6
#cat ../lorem/sed.txt

#Ejercicio 7
#cat ../lorem/{at.txt,lorem.txt}

#Ejercicio 8
#head -3 ../lorem-copy/sed.txt

#Ejercicio 9
#tail -3 ../lorem-copy/sed.txt

#Ejercicio 10
#echo "Homo homini lupus.">>../lorem-copy/sed.txt

#Ejercicio 11
#tail -3 ../lorem-copy/sed.txt

#Ejercicio 12
#sed -i -e s/et/ET/g ../lorem-copy/at.txt

#Ejercicio 13
#id -F

#Ejercicio 14
#pwd

#Ejercicio 15
#ls ../lorem/*.txt

#Ejercicio 16
#wc -l < ../lorem/sed.txt

#Ejercicio 17
#.. ; ls -f | grep -c lorem

#EJercicio 18
#grep -o "et" ../lorem/at.txt #cuenta las veces que aparece et

#Ejercicio 19
#grep -r "et" ../lorem/at.txt | wc -l

#Ejercicio 20
#grep -r "et" ../lorem-copy/ | wc -l #cuenta la palabra et


##BONUS
#name="Blanca"
#echo $name
#mkdir $name
#rmdir $name
#ls ../lorem/
#for file in $(ls ../lorem/)
#do
#fn=${file%.*}
#echo ${fn} 'has' ${#fn} 'characters length'
#done 
#top
#ps
#sysctl -n machdep.cpu.brand_string
#tar -cf lorem-compressed.tar.gz ../lorem/ ../lorem-copy/
#mkdir lorem-uncompressed
#tar -xvf lorem-compressed.tar.gz