#!/bin/bash
#======================================
# File name:shell_04字符串运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:44
#======================================
#字符串运算符
#先来看一个例子：
#!/bin/sh
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
