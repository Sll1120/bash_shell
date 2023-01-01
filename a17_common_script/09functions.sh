#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 23:33
# * Filename : 45functions.sh
# **********************************************************
#定义函数的格式1
test (){
	read -p "pls input:" value
	return $[$value * 2]
}
test 
echo $?

#定义函数的格式2
function example {
echo "Hello world!"
}
example
