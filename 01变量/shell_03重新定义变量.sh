#!/bin/bash
#======================================
# File name:shell_02重新定义变量.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 09:27
#======================================
#重新定义变量
#已定义的变量，可以被重新定义，如：
myUrl="http://see.xidian.edu.cn/cpp/linux/"
echo ${myUrl}
myUrl="http://see.xidian.edu.cn/cpp/shell/"
echo ${myUrl}
#这样写是合法的，但注意，第二次赋值的时候不能写:
#a$myUrl="http://see.xidian.edu.cn/cpp/shell/"，
#使用变量的时候才加美元符（$）。
