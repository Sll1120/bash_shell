#!/bin/bash
#======================================
# File name:shell_04字符串运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:44
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

: '
如果表达式中包含特殊字符，Shell 将会进行替换。
例如，在双引号中使用变量就是一种替换，转义字符也是一种
1)替换。
举个例子：
#!/bin/bash
a=10
echo -e "Value of a is $a \n"
运行结果：
Value of a is 10
这里 -e 表示对转义字符进行替换。如果不使用 -e 选项，将会原样输出：
Value of a is 10\n

2)下面的转义字符都可以用在 echo 中：
转义字符 含义
\        反斜杠
\a       警报，响铃
\b       退格（删除键）
\f       换页(FF)，将当前位置移到下页开头
\n       换行
\r       回车
\t       水平制表符（tab 键）
\v       垂直制表符
可以使用 echo 命令的 -E 选项禁止转义，默认也是不转义的；使用 -n 选项可以禁止插入换行符。
'

#字符串运算符
#先来看一个例子：
a="abc"
b="efg"
if [ $a = $b ]
then
    echo "$a = $b : a is equal to b"
else
    echo "$a = $b: a is not equal to b"
fi
if [ $a != $b ]
then
    echo "$a != $b : a is not equal to b"
else
    echo "$a != $b: a is equal to b"
fi
if [ -z $a ]
then
    echo "-z $a : string length is zero"
else
    echo "-z $a : string length is not zero"
fi
if [[ -n $a ]]
then
    echo "-n $a : string length is not zero"
else
    echo "-n $a : string length is zero"
fi
if [ $a ]
then
    echo "$a : string is not empty"
else
    echo "$a : string is empty"
fi
#运行结果：
#abc = efg: a is not equal to b
#abc != efg : a is not equal to b
#-z abc : string length is not zero
#-n abc : string length is not zero
#abc : string is not empty
: '
字符串运算符列表
运算符  说明                                        举例
=       检测两个字符串是否相等，相等返回 true。     [ $a = $b ] 返回 false。
!=      检测两个字符串是否相等，不相等返回 true。   [ $a != $b ] 返回true。
-z      检测字符串长度是否为0，为0返回 true。       [ -z $a ] 返回 false。
-n      检测字符串长度是否为0，不为0返回 true。     [ -n $a ] 返回 true。
str     检测字符串是否为空，不为空返回 true。       [ $a ] 返回true。
'
