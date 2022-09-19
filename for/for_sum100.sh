#!/bin/bash
#by author suliangliang on 2022-8-1
#1++100总和
#1
n=0
for i in {1..100}
do 
	n=`expr $i + $n`
done
echo $n

#2
k=0
l=1
while ((l<=100))
do
	k=`expr $k + $l` 
	((l++))
done
echo $k
