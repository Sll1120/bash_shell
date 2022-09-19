#!/bin/bash
#by suliangliang on 2022-xx-xx
#Remark:
n=0
for i in {1..10}
do 
	n=`expr $i + $n`
done
echo $n

