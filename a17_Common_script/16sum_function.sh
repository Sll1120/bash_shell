#!/bin/bash
#======================================
# File name:求和函数运算.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 18:44
#======================================
function sum(){
 s=0;
 s=$[$1+$2]
 echo $s
}
read -p "input your parameter " p1
read -p "input your parameter " p2
sum $p1 $p2
