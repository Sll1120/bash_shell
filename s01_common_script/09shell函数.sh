#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 23:33
# * Filename : 45functions.sh
# **********************************************************
#定义函数的格式1
test() {
	read -p "pls input a number:" value
	return $(($value * 2))
}
test
echo $?

#定义函数的格式2
function example {
	echo "Hello world!"
}
example

#函数的例子
function sum(){
 s=0;
 s=$[$1+$2]
 echo $s
}
read -p "请输入第一个加数 " p1
read -p "请输入第二个加数 " p2
sum $p1 $p2
