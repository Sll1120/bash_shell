#!/bin/bash
#by suliangliang on 2022-08-06
#Remark:
#1
for i in "$*"
do 
 echo "shen zhen $i"
done
#2
for j in "$@"
do 
 echo "shen zhen $j"
done
#3
s=0;
for((i=1;i<100;i++))
do 
 s=$[$s+$i]
done 
echo $s
#4
r=0;
a=0;
b=0;
for((x=1;x<=9;x++))
do 
a=$[$a+$x] 
echo $x
done
echo r=$[$a+$x]
