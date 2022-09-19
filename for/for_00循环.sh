#!/bin/bash
#======================================
# file name:caipiao.sh
# author:liangliangSu
# date of writing:2022-09-17 22:44
#======================================
sum=0 
read -p '请输入一个1-100之间的整数：' a
for ((i=1;i<=$a;i++))
do
    sum=$[$sum + $i]
done
echo "$sum"
