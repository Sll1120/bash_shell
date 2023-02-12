#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-04 16:08
# * Filename : 01if_else语句.sh
# **********************************************************
: '
if 语句通过关系运算符判断表达式的真假来决定执行哪个分支,Shell 有三种 if ... else语句：
- if ... fi 语句；
- if ... else ... fi 语句；
- if ... elif ... else ... fi 语句;
'

: '
1) if ... else 语句
if ... else 语句的语法：
if [ expression ]
then
    Statement(s) to be executed if expression is true
fi
如果 expression 返回 true，then 后边的语句将会被执行；如果返回 false，不会执行任何语句。
最后必须以 fi 来结尾闭合 if，fi 就是 if 倒过来拼写，后面也会遇见。
注意：expression 和方括号([ ])之间必须有空格，否则会有语法错误。
'
#举个例子：
echo '(1) -----------------------------------------------------------'
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
fi
if [ $a != $b ]; then
	echo "a is not equal to b"
fi
#运行结果：
#a is not equal to b

: '
2) if ... else ... fi 语句
if ... else ... fi 语句的语法：
if [ expression ]
then
    Statement(s) to be executed if expression is true
else
    Statement(s) to be executed if expression is not true
fi
如果 expression 返回 true，那么 then 后边的语句将会被执行；否则，执行 else 后边的语句。
'
echo '(2) -----------------------------------------------------------'
#举个例子：
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
else
	echo "a is not equal to b"
fi
#执行结果：
#a is not equal to b

: '
3) if ... elif ... else ... fi 语句
if ... elif ... else ... fi 语句可以对多个条件进行判断，语法为：
if [ expression 1 ]
then
    Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
    Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
    Statement(s) to be executed if expression 3 is true
else
    Statement(s) to be executed if no expression is true
fi
'
#哪一个 expression 的值为 true，就执行哪个 expression 后面的语句；如果都为 false，那么不执行任何语句。
echo '(3) -----------------------------------------------------------'
#举个例子：
a=10
b=20
if [ $a == $b ]; then
	echo "a is equal to b"
elif [ $a -gt $b ]; then
	echo "a is greater than b"
elif [ $a -lt $b ]; then
	echo "a is less than b"
else
	echo "None of the condition met"
fi
#运行结果：
#a is less than b
echo '(4) -----------------------------------------------------------'
read -p '请输入你的选择的信息[cpu|mem|hard]：' i
if [ $i == cpu ];then
	echo -e "\e[1;32mcpu info is ：\e[0m"
	cat /proc/cpuinfo
elif [ $i == mem ];then
	echo -e "\e[1;32mmem info is：\e[0m"
	cat /proc/meminfo
elif [ $i == hard ];then
	echo -e "\e[1;32mharddisk info is：\e[0m"
	df -h
else 
	echo -e "\e[1;31m请确认，你输入的信息有误!!!\e[0m"
fi

echo '(5) -----------------------------------------------------------'
read -p '请输入你的选择的信息[cpu|mem|hard]：' j
case $j in
	cpu)
		echo -e "\e[1;32mcpu info is ：\e[0m"
		cat /proc/cpuinfo
		;;
	mem)
		echo -e "\e[1;32mmem info is：\e[0m"
		cat /proc/meminfo
		;;
	hard)
		echo -e "\e[1;32mharddisk info is：\e[0m"
		df -h
		;;
	*)
		echo -e "\e[1;31m请确认，你输入的信息有误!!!\e[0m"
esac
