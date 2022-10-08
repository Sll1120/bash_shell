#!/bin/bash
#======================================
# File name:shell_22求和函数运算.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 18:44
#======================================
#!/bin/bash

function sum()
{
 s=0;
 s=$[$1+$2]
 echo $s
}
read -p "input your parameter " p1
read -p "input your parameter " p2

sum $p1 $p2

function multi()
{
 r=0;
 r=$[$1/$2]
 echo $r
}
read -p "input your parameter " x1
read -p "input your parameter " x2

multi $x1 $x2

v1=1
v2=2
let v3=$v1+$v2
echo $v3
