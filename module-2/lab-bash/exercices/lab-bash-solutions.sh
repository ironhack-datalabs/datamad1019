#!/bin/bash
#1
echo Hello World
#2
mkdir new_dir
#3
rmdir new_dir
#4
cp sed.txt ./lorem-copy
#5
cp at.txt ./lorem-copy; cp lorem.txt ./lorem-copy
#6
cat ./lorem/sed.txt
#7
cat ./lorem/at.txt; cat ./lorem/lorem.txt
#8
head -3 ./lorem/sed.txt
#9
tail -3 ./lorem/sed.txt 
#10
echo "Homo homini lupus" >> ./lorem/sed.txt
#11
tail -3 ./lorem/sed.txt
#12
sed -i 's/et/ET/g' ./lorem-copy/at.txt
#13
who
#14
pwd
#15
find ./lorem/ -type f -name "*.txt"
#16
wc -l ./lorem/sed.txt
#17
find . -type f -name "lorem*" | wc -l
#18
grep "et" ./lorem/at.txt
#19
grep -c "et" ./lorem/at.txt
#20
cat ./lorem-copy | grep -c -o "et" 