#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-22 22:52
# * Filename : 35判断用户输入的是什么文件.sh
# **********************************************************
read -p "please input a filename:" file

if [ -z "$file" ]
#判断file变量是否为空
then
	echo "error,please input a filename!"
	exit 1
elif [ ! -e "$file" ]
#判断file的值是否存在
then 
	echo "your input is not a file!"
	exit 2
elif [ -f "$file" ]
then 
	echo "your input is regulare file!"
elif [ -d "$file" ]
then 
	echo "your input is a directory!"
else
	echco "$file is an otrher file ! "
fi
