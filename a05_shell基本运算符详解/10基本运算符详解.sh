#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-07 13:59
# * Filename : 10基本运算符详解.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
: <<!
基本运算符详解 
1.算数运算符
2.关系运算符
3.布尔运算符
4.字符串运算符
5.文件测试运算符

原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
expr 是一款表达式计算工具，使用它能完成表达式的求值操作。
!

#例如，两个数相加(注意使用的是反引号 ` 而不是单引号 ')：
#!/bin/bash
val=`expr 2 + 2`
echo "两数之和为 : $val"

# 两点注意：
# 1.表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们大多数编程语言不一样
# 2.完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。
: '
1,算数运算符
假定变量 a 为 10，变量 b 为 20：
运算符	说明     举例
+	加法	`expr $a + $b` 结果为30
-	减法	`expr $a - $b` 结果为-10
*	乘法	`expr $a * $b` 结果为200
/	除法	`expr $b / $b` 结果为2
%	取余	`expr $b % Sa` 结柱为0
=	赋值	a=$b将抱变量b的值贿给a
==	相等	用于比较两个数字,相同则返回true。[ $a == $b ]返回false
!=	不相等  不相等,用于比较两个数字,不相同则返回true。[[ $a != $b ]返回true
注意：条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]
'
#实例：
#!/bin/bash
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
   echo "a 等于 b"
fi
if [ $a != $b ]
then
   echo "a 不等于 b"
fi

#注意：
# 乘号(*)前边必须加反斜杠()才能实现乘法运算；
# if...then...fi 是条件语句，后续将会讲解。
# 在 MAC 中 shell 的 expr 语法是：$((表达式))，此处表达式中的 "*" 不需要转义符号 "" 。

: '
2,关系运算符
关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
下表列出了常用的关系运算符，假定变量 a 为 10，变量 b 为 20：
运算符	说明     						举例
-eq	检测两个数是否标等,相等返回true.			[$a -eq $b]返回false
-ne	检测两个数是否不相等,不相等返回true			[$a -ne $b]返回true
-gt	检测左边的数是否大于右边的,如果是,则返回true。		[$a -gt $b]返回false
-lt	检测左边的数是否小于右边的,如果是,则返回true。		[$a -lt $b]返回true
-ge	检测左边的数是否大于等于右边的,如果显,败返回true。	[$a -ge $b]返回false
-le	检测左边的数是否小于等于右边的,如果是,则返回true。	[$a -le $b]返回true
'

: '
3,布尔运算符
下表列出了常用的布尔运算符，假定变量a为10，变量b为20：
运算符 	说明							举例
!	true。非运算，表达式为true则返回false，否则返回		[ !false ]返回true。
-0	或运算，有一个表达式为true则返回true			[ $a -lt 20 -o $b -gt 100 ]返回true
-a	与运算，两个表达式都为true才返回true。false。		[ $a -lt 20 -a $b -gt 100 ]返回false
'

: '
4,逻辑运算符
介绍Shell的逻辑运算符，假定变量a为10，变量b为20:
运算符  说明		例子
&&	逻辑的AND	[[ $a -lt 100 && $b -gt 100 ]]	返回false
||	逻辑的OR	[[ $a -lt 100 || $b -gt 100 ]]	返true
'

#5,字符串运算符
#下表列出了常用的字符串运算符，假定变量 a 为 "abc"，变量 b 为 "efg"
运算符		说明						例子
=		检测两个字符串是否相等，相等返回true。		[ $a = $b ] 返回 false
!=		检测两个字符串是否相等，不相等返回true。	[ $a != $b ] 返回 true
-z		检测字符串长度是否为0，为0返回true。		[ -z $a ] 返回 false
-n		检测字符串长度是否不为0，不为0返回true。	[ -n "$a" ] 返回 true
$		检测字符串是否为空，不为空返回true。		[ $a ] 返回 true

#6,文件测试运算符
#文件测试运算符用于检测Unix文件的各种属性。
#属性检测描述如下：
: <<!
运算符	   说明						     	   例子
-b file    检测文件是否是块设备文件，如果是，则返回true      	   [ -b $file ] 返回 false
-c file    检测文件是否是字符设备文件，如果是，则返回true    	   [ -c $file ] 返回 false
-d file    检测文件是否是目录，如果是，则返回true	     	   [ -d $file ] 返回 false
-f file    检测文件是否是普通文件，如果是，则返回true	  	   [ -f $file ] 返回 false
-g file    检测文件是否设置了SGID位，如果是，则返口true  	   [ -g $file ] 返回 false
-k file    检测文件是否设置了粘着位(StickyBit)，如果是，则返回true [ -k $file ] 返回 false
-p file    检测文件是否是有名管道，如果是，则返回true		   [ -b $file ] 返回 false
-u file    检测文件是否设置了SUID位，如果是，则返回true		   [ -b $file ] 返回 false
-r file    检测文件是否可读，如果是，则返回true			   [ -b $file ] 返回 false
-w file    检测文件是否可写，如果是，则返回true			   [ -b $file ] 返回 false
-x file    检测文件是否可执行，如果是，则返回true		   [ -b $file ] 返回 false
-s file    检测文件是否为空(文件大小是否大于0)，不为空返回true     [ -b $file ] 返回 false
-e file    检测文件(包括目录)是否存在，如果是，则返回true   	   [ -b $file ] 返回 false
!
#其他检查符：
#-S:判断某文件是否socket。
#-L:检测文件是否存在并且是一个符号链接。

#实例
#变量 file 表示文件 /var/www/runoob/test.sh，它的大小为 100 字节，具有 rwx 权限。下面的代码，将检测该文件的各种属性：
#
##!/bin/bash
#
#file="/var/www/runoob/test.sh"
#if [ -r $file ]
#then
#   echo "文件可读"
#else
#   echo "文件不可读"
#fi
#if [ -w $file ]
#then
#   echo "文件可写"
#else
#   echo "文件不可写"
#fi
#if [ -x $file ]
#then
#   echo "文件可执行"
#else
#   echo "文件不可执行"
#fi
#if [ -f $file ]
#then
#   echo "文件为普通文件"
#else
#   echo "文件为特殊文件"
#fi
#if [ -d $file ]
#then
#   echo "文件是个目录"
#else
#   echo "文件不是个目录"
#fi
#if [ -s $file ]
#then
#   echo "文件不为空"
#else
#   echo "文件为空"
#fi
#if [ -e $file ]
#then
#   echo "文件存在"
#else
#   echo "文件不存在"
#fi
