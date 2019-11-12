##EJ 1
#echo "Hello world"

##EJ 2
#mkdir new_dir

##EJ 3
#rmdir new_dir

##EJ 4 (pongo ./ porque estoy trabajando desde la carpeta del lab)
#cp ./lorem/sed.txt ./lorem-copy/

#EJ 5
#cp ./lorem/*.txt ./lorem-copy/

#EJ 6
#cat ./lorem/sed.txt

#EJ 7 (Acordarme no poner espacios)
#cat ./lorem/{at.txt,lorem.txt}
#Other wat
#cat ./lorem/at.txt ./lorem/lorem.txt

#EJ 8
#head -n 3 ./lorem/sed.txt

#EJ 9
#tail -n 3 ./lorem/sed.txt

#EJ 10
#echo "Homo homini lupus." >> ./lorem-copy/sed.txt

#EJ 11
#tail -n 3 ./lorem-copy/sed.txt

#EJ 12
#sed -i -e s/et/ET/g ./lorem-copy/at.txt

#EJ 13
#id -F
#users

#EJ 14
#pwd

#EJ 15
#ls ./lorem/*.txt

#EJ 16
#wc -l ./lorem/sed.txt

#EJ 17
#mdfind lorem (encuentra todo lo que contenga 'lorem' incluso dentro del archivo)
#ls -f | grep -c lorem (cuenta el numero de archivos con ese nombre)

#EJ 18
#grep -r 'et' ./lorem/at.txt

#EJ19
#grep -c 'et' ./lorem/at.txt (cuenta las palabras et)
#grep -o 'et' ./lorem/at.txt | wc -l (te cuenta todo lo que tiene et)

#EJ 20
#grep -r 'et' ./lorem-copy/ | wc -l (te cuenta la palabra et en todos los archivos de un carpeta)

#BONUS
#NAME='JUANMA'
#echo $NAME
#mkdir $NAME
#rmdir $NAME

#(para encontrar los archivos lorem.txt)
#find . -name lorem.txt | while read fname; do
#  echo "$fname"
#done

for file in $(ls ./lorem); do
echo ${file} 'has' ${#file} 'character length'
done