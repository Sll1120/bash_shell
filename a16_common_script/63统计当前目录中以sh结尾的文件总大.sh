#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-28 22:01
# * Filename : 62统计当前目录中以.sh结尾的文件总大.sh
# **********************************************************
# find . -name "*.sh" -exec du -k {} \; |awk '{sum+=$1}END{print sum}'

for size in $(ls -l *.sh |awk '{print $5}'); do
    sum=$(($sum+$size))
done
echo $sum

