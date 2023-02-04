#!/bin/bash
#======================================
# File name:shell_01算术运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:07
#======================================
: '
Bash 支持很多运算符，包括算数运算符、关系运算符、布尔运算符、字符串运算符和文件测试运算符。
原生 bash 不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
expr 是一款表达式计算工具，使用它能完成表达式的求值操作。
例如，两个数相加：
#!/bin/bash
val=`expr 2 + 2`
echo "Total value : $val"
运行脚本输出：
Total value : 4
两点注意：
1 - 表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
2 - 完整的表达式要被包含，注意这个字符不是常用的单引号，在 Esc 键下边。
'
#算术运算符
#先来看一个使用算术运算符的例子：
#!/bin/sh
a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"
val=`expr $a - $b`
echo "a - b : $val"
val=`expr $a \* $b`
echo "a * b : $val"
val=`expr $b / $a`
echo "b / a : $val"
val=`expr $b % $a`
echo "b % a : $val"
if [ $a == $b ]
    then
        echo "a is equal to b"
fi
if [ $a != $b ]
    then
        echo "a is not equal to b"
fi
#运行结果：
#a + b : 30
#a - b : -10
#a * b : 200
#b / a : 2
#b % a : 0
#a is not equal to b
#注意： - 乘号(*)前边必须加反斜杠()才能实现乘法运算； - if...then...fi 是条件语句，后续将会讲解。
: '
算术运算符列表
运算符     说明    举例
+          加法    `expr $a + $b` 结果为30。
-          减法    `expr $a - $b` 结果为 10。
*          乘法    `expr $a \* $b` 结果为200。
/          除法    `expr $b / $a` 结果为2。
%          取余    `expr $b % $a` 结果为0。
=          赋值    a=$b 将把变量 b 的值赋给 a。
==         相等。  用于比较两个数字，相同则返回 true。[ $a == $b ] 返回false。
!=         不相等  用于比较两个数字，不相同则返回 true。[ $a != $b ] 返回 true。
'
#注意：条件表达式要放在方括号之间，并且要有空格，例如 [$a==$b] 是错误的，必须写成 [ $a == $b ]。
