#!/bin/bash
#======================================
# File name:shell_03获取数组的长度.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 12:30
#======================================
#获取数组的长度
#获取数组长度的方法与获取字符串长度的方法相同，例如：
## 取得数组元素的个数
array_name=(`seq 9`)
echo -e "length=${#array_name[@]}"
echo -e "length=${#array_name[*]}"
# 取得数组单个元素的长度
echo -e "lengthn=${#array_name[n]}"

echo '-----------------------------------------------------------'
array_name=(sll sxx lrn liangliangSu)
echo -e "length=${#array_name[@]}"
echo -e "length=${#array_name[*]}"
# 取得数组单个元素的长度
echo -e "lengthn=${#array_name[n]}"
