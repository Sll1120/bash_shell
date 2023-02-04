#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-04 13:02
# * Filename : 02变量替换删除.sh
# **********************************************************
: '
变量替换
变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值
可以使用的变量替换形式：
形式                说明
${var}              变量本来的值
${var:-word}        如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值
${var:=word}        如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
${var:?message}     如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标 准错误输出，
可以用来检测变量 var 是否可以被正常赋值。若此替换出现在 Shell 脚本中，那么脚本将停止运行。
${var:+word}        如果变量 var 被定义，那么返回 word，但不改变 var 的值。
'
echo '(1)-----------------------完美分割线--------------------------------'
#请看下面的例子：
echo ${var:-"Variable is not set"}
echo "1 - Value of var is ${var}"
echo "----------------------------------------"
echo ${var:="Variable is not set"}
echo "2 - Value of var is ${var}"
echo "----------------------------------------"
unset var
echo ${var:+"This is default value"}
echo "3 - Value of var is $var"
echo "----------------------------------------"
var="Prefix"
echo ${var:+"This is default value"}
echo "4 - Value of var is $var"
echo "----------------------------------------"
echo ${var:?"Print this message"}
echo "5 - Value of var is ${var}"
#运行结果：
#Variable is not set
#1 - Value of var is
#Variable is not set
#2 - Value of var is Variable is not set
#3 - Value of var is
#This is default value
#4 - Value of var is Prefix
#Prefix
#5 - Value of var is Prefix

#删除变量的演示场景
#某变量取值为小数, 又希望和整数作比对, 但是小数是没有办法
#作比对的! 例如3.5和53怎么比对呢? 只能将小数位去掉, 形成 3和53对了!
#制除变量说明
: '
变量			说明
$(变量#匹配规则)	从头开始匹配, 最短删除
$(变量##匹配规则)	从头开始匹配, 最长删除
$(使变量%匹配规则)	从尾开始匹配, 最短删除
$(使变量%%匹配规则)	从尾开始匹配, 最长删除
'
echo '(2)-----------------------完美分割线--------------------------------'
# $变量(变量#匹配规则] 	从头开始匹配, 最短删除;
net="www.baidu.com"
echo ${net#}   #只带这个# ，不带规则是默认显示变量的赋值内容！
echo ${net#*w} #从头开始删除 *代表了所有 删除到w 这个符号结束(依靠最短匹配原则）
echo ${net#*.}
echo ${net#*b}
echo ${net#*u}
echo '(3)-----------------------完美分割线--------------------------------'
# $(变量##匹配规则)  从头开始匹配，最长匹配（贪婪的方式）；
echo ${net##*.}
echo ${net##*w}
echo '(4)-----------------------完美分割线--------------------------------'
# ${变量%匹配规则}   从尾开始匹配，最短删除；
echo ${net%.*}
echo ${net%*.}
echo '(5)-----------------------完美分割线--------------------------------'
# ${变量%%匹配规则}   从尾开始匹配，最长删除（贪婪模式）；
echo ${net%%.*}

#前面已经讲到，变量名只能包含数字、字母和下划线，因为某些包含其他字符的变量有特殊含义，这样的变量被
#称为特殊变量。
: '
#特殊变量列表
#变量 含义
#**********************************************************************************
$0 当前脚本的文件名

Sn 传递给脚本或函数的参数, n 是一个数字,表示第几个参数, 例如, 第一个参数是$1 ,第二个参数是$2

$# 传递给脚本或函数的参数个教

$* 传递给脚本或函数的所有参数,被双引号（" "）包含时，加引号代表了所有的参数作为一个整体传递；

$@ 传递给脚本或函数的所有參数, 被双引号(" ")包含时,加引号代表了所有的参数挨个传递；

$? 上个命令的退出状态 , 或函数的返回值

$- 显示Shell使用的当前选顶,参看set命<

$$ 当前Shell进程ID, 对于 Shell 脚本 , 就是这些脚本所在的进程ID

$! 后台运行的最后一个进程的ID号
'
echo '(6)-----------------------完美分割线--------------------------------'
#请看下面的脚本：
echo "#脚本名称本身：$0"
echo "#第一个shell脚本的位置参数: $1"
echo "#第二个shell脚本的位置参数: $2"
echo "#第三个shell脚本的位置参数: $3"
echo "#脚本接受参数的总和为：     $#"
curl -I qq.com &>/dev/null #判断网络通讯是否正常
echo "运行命令的状态为:$?"
echo "脚本的ID为: $$"
echo "\$* 的结果为:$*" （对比观察）
echo "\$@ 的结果为:$@" （对比观察）
echo '-----------------------------------------------------------'
echo "\$* 循环接收的结果"
for i in "$*"; do
	echo $i
done
echo "\$@ 循环接收的结果"
for j in "$@"; do
	echo $j
done
echo '-----------------------------------------------------------'

: '
$* 和 $@ 的区别
$* 和 $@ 都表示传递给函数或脚本的所有参数:
1)不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
2)但是当它们被双引号(" ")包含时，
"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；
"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
#$*循环之后会将参数整体输出；
#$@循环之后会将参数分个输出！
'
echo '(7)-----------------------完美分割线--------------------------------'
#下面的例子可以清楚的看到 $* 和 $@ 的区别：
echo "print each param from \$*"
for var in $*; do
	echo "$var"
done
echo "print each param from \$@"
for var in $@; do
	echo "$var"
done
echo '-----------------------------------------------------------'
echo "print each param from \"\$*\""
for var in "$*"; do
	echo "$var"
done
echo "print each param from \"\$@\""
for var in "$@"; do
	echo "$var"
done

: '
变量替换
可以理解成就是不改变原有变量的情况下，对变量进行替换。
从格式上来看和sed命令很类似！
总之记住 ：
 / 表示替换匹配的第一个字符串；
//  表示替换匹配的所有字符串；
'
echo '(8)-----------------------完美分割线--------------------------------'
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
