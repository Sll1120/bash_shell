#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-30 15:35
# * Filename : 04变量替换.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
: '
变量替换
可以理解成就是不改变原有变量的情况下，对变量进行替换。
从格式上来看和sed命令很类似！
总之记住 ：
 / 表示替换匹配的第一个字符串；
//  表示替换匹配的所有字符串；
'
# ${变量/旧字符串/新字符串}  替换变量内的旧字符串为新字符串，只替换一个
# 将小写的d替换成大写的D
domain=daidai.com
echo ${domain/d/D}

# ${变量//旧字符串/新字符串}  替换变量内的旧字符串为新字符串，替换全部
echo ${domain//d/D}

# 可以替换字符串,也有删除作用
echo ${domain/daidai/}

# 替换变量场景
# 需求：变量  
# string="The GPL is an open source license, and the GPL is an excellent open source project"
# 执行脚本后，打印输出变量内容，并给出用户以下选项：
#打印string长度
#删除字符串中所有的GPL
#替换第一个GPL为BSD
#替换全部的GPL为BSD
#编写思路：
#首先定义 string的变量和内容，并且打印出来；
echo '(2)-----------------------完美分割线--------------------------------'
#然后，定义用户选项，利用cat <<EOF ,注意里面的不要有单引号，要不然会认为成一个变量了！
#执行后的结果：
#给出了选项，就需要利用到read 交互模式进行选择选项了。
#read 介绍
#Shell变量除了可以直接赋值，或者脚本传参外，
#还可以使用read命令从标准输入中获得！主要作用交互式接受用户输入，然后给变量赋值；
#因为 read 是系统的bash内置命令，除了在网上查询，可以 man read
#语法格式：
#-p  设置提示信息；
#-t   设置输入等待的时间，单位默认为秒
#read -p "请输入你要操作的编号 [1 | 2 | 3 | 4]:"   Action
#最后要进行选项判断了。
#如何得到第一个选项的字串串的长度？
#用最短匹配规则来取值，而不是用 wc 来取值
#如果用wc来取值也是可以的！
echo ${string} | wc -L
#接下来，就需要写一些判断语句了
#1 定义用户变量并打印
string="The GPL is an open source license, and the GPL is an excellent open source project"
echo ${string}
#2 给出用户选项
echo ""
cat <<EOF
1)打印string长度
2)删除字符串中所有的GPL
3)替换第一个GPL为BSD
4)替换全部的GPL为BSD
EOF
while true; do
	read -p "请输入你要操作的编号 [1 | 2 | 3 | 4]:" Action
	if [ $Action -eq 1 ]; then
		echo ${#string}
	elif [ $Action -eq 2 ]; then
		echo ${string//GPL/}
	elif [ $Action -eq 3 ]; then
		echo ${string/GPL/BSD}
	elif [ $Action -eq 4 ]; then
		echo ${string//GPL/BSD}
	else 
		echo "超出以上选择范围"
		exit 0
	fi
done
