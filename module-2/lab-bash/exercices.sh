#!/bin/bash
ls
echo 'Hello World'
mkdir new_dir
rmdir new_dir
cp lorem/sed.txt lorem_copy
cp lorem/at.txt lorem-copy; cp lorem/lorem.txt lorem-copy
cat lorem/sed.txt
cat lorem/at.txt; cat lorem/lorem.txt
head -3 lorem-copy/sed.txt
tail -3 lorem-copy/sed.txt
echo 'Homo homini lupus' >> lorem-copy/sed.txt
tail -3 lorem-copy/sed.txt
sed -i 's/et/ET/g' lorem-copy/at.txt
who | cut -d' ' -f1 
pwd
find lorem -type f -name "*.txt"
wc -l lorem/sed.txt
find lorem | wc -l
grep -o et lorem/at.txt | wc -l
find lorem -type f | xargs grep -o et | wc -l

#BONUS
export name='Mer'
echo $name
mkdir $name
rmdir $name

for f in $(ls lorem/)
do
        nletters=$(echo -n ${f%.*} | wc -c)
        echo ${f%.*}' has '$nletters' characters length'
done;

top -n 10 
ps -aux --sort -%cpu
lshw -class processor
lscpu
alias findall=(find .)
tar czfv lorem-compressed.tar.gz lorem lorem-copy
mkdir loren-uncompressed
tar xzfv lorem-compressed.tar.gz -C loren-uncompressed

