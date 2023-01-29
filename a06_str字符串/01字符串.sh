#!/bin/bash
#======================================
# File name:shell_01字符串.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 12:16
#======================================
#字符串是 shell 编程中最常用最有用的数据类型（除了数字和字符串，也没啥其它类型好用了），字符串可以用
#(1)单引号，也可以用双引号，也可以不用引号。单双引号的区别跟 PHP 类似。
#单引号
echo '(1) -----------------------------------------------------------'
str='this is a string'
#单引号字符串的限制： 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的； 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
#(2)双引号
echo '(2) -----------------------------------------------------------'
your_name='qinjx'
str="Hello, I know your are \"$your_name\"! \n"
#双引号的优点： 双引号里可以有变量 双引号里可以出现转义字符
#(3)拼接字符串
echo '(3) -----------------------------------------------------------'
your_name="qinjx"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1
#(4)获取字符串长度
echo '(4) -----------------------------------------------------------'
string="abcd"
echo ${#string} #输出4
#(5)提取子字符串/字符串切片
string="alibaba is a great company"
#输出 liba
Str="Learn Bash Commands from UbuntuPit"
#subStr=${Str:0:20}
subStr=$(echo $Str | cut -d ' ' -f 1-3)
echo $subStr
echo ${string:1:4}
#(6)查找子字符串
echo '(5) -----------------------------------------------------------'
string="alibaba is a great company"
echo $(expr index "$string" alibaba)
echo $(expr index "$string" is)
echo $(expr index "$string" a)
echo $(expr index "$string" great)
echo $(expr index "$string" company)
echo '(6) -----------------------------------------------------------'
#添加两个值
echo -n "Enter first number:"
read x
echo -n "Enter second number:"
read y
((sum = x + y))
echo "The result of addition=$sum"
echo '(7) -----------------------------------------------------------'
sum=0
for ((counter = 1; counter < 5; counter++)); do
	echo -n "Enter Your Number:"
	read n
	((sum += n))
	#echo -n "$counter "
done
printf "\n"
echo "Result is: $sum"

