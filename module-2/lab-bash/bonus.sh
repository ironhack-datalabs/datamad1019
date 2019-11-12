#!bin/bash
for f in $(ls lorem):
do
len=$(echo -n ${f%.*} | wc -m)
echo ${f%.*} has $len chracters length 
done

top
ps axu

sysctl -n machdep.cpu.brand_string

alias grep='grep --color=auto'

tar -czvf lorem-compressed.tar.gz lorem lorem-copy
mkdir lorem-uncompressed
tar -xzvf lorem-compressed.tar.gz -C lorem-uncompressed
