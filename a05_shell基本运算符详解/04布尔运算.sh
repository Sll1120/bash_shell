#!/bin/bash
#======================================
# File name:shell_03布尔运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:37
#======================================
#布尔运算符
#先来看一个布尔运算符的例子：
#!/bin/sh
a=10
b=20
if [ $a != $b ]
then
    echo "$a != $b : a is not equal to b"
else
    echo "$a != $b: a is equal to b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
    echo "$a -lt 100 -a $b -gt 15 : returns true"
else
    echo "$a -lt 100 -a $b -gt 15 : returns false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
    echo "$a -lt 100 -o $b -gt 100 : returns true"
else
    echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
    echo "$a -lt 100 -o $b -gt 100 : returns true"
else
    echo "$a -lt 100 -o $b -gt 100 : returns false"
fi
#运行结果：
#10 != 20 : a is not equal to b
#10 -lt 100 -a 20 -gt 15 : returns true
#第 9 章 Shell 运算符：Shell 算数运算符、关系运算符、布尔运算符、字符串运算符等 | 50
#10 -lt 100 -o 20 -gt 100 : returns true
#10 -lt 5 -o 20 -gt 100 : returns false
: '
布尔运算符列表
运算符      说明                                            举例
! 非运算，  表达式为 true 则返回 false，否则返回 true。     [ ! false ] 返回 true。
-o 或运算， 有一个表达式为 true 则返回 true。     [ $a -lt 20 -o $b -gt 100 ] 返回true。
-a 与运算， 两个表达式都为 true 才返回 true。     [ $a -lt 20 -a $b -gt 100 ] 返回false
'
