#!/bin/bash
#======================================
# File name:shell_02关系运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:26
#======================================
: '
关系运算符
关系运算符只支持数字，不支持字符串，除非字符串的值是数字。
'
#先来看一个关系运算符的例子：
#!/bin/sh
a=10
b=20
echo '(0) -----------------------------------------------------------'
if [ $a -eq $b ]
then
     echo "$a -eq $b : a is equal to b"
else
     echo "$a -eq $b: a is not equal to b"
fi
echo '(1) -----------------------------------------------------------'
if [ $a -ne $b ]
then
    echo "$a -ne $b: a is not equal to b"
else
    echo "$a -ne $b : a is equal to b"
fi
echo '(2) -----------------------------------------------------------'
if [ $a -gt $b ]
then
    echo "$a -gt $b: a is greater than b"
else
    echo "$a -gt $b: a is not greater than b"
fi
echo '(3) -----------------------------------------------------------'
if [ $a -lt $b ]
then
    echo "$a -lt $b: a is less than b"
else
    echo "$a -lt $b: a is not less than b"
fi
echo '(4) -----------------------------------------------------------'
if [ $a -ge $b ]
then
    echo "$a -ge $b: a is greater or equal to b"
else
    echo "$a -ge $b: a is not greater or equal to b"
fi
echo '(5) -----------------------------------------------------------'
if [ $a -le $b ]
then
    echo "$a -le $b: a is less or equal to b"
else
    echo "$a -le $b: a is not less or equal to b"
fi
#运行结果：
#10 -eq 20: a is not equal to b
#10 -ne 20: a is not equal to b
#10 -gt 20: a is not greater than b
#10 -lt 20: a is less than b
#10 -ge 20: a is not greater or equal to b
#10 -le 20: a is less or equal to b
: '
关系运算符列表
运算符  说明                                                 举例
-eq     检测两个数是否相等，相等返回true。                   [ $a -eq $b ] 返回true。
-ne     检测两个数是否相等，不相等返回 true。                [ $a -ne $b ] 返回 true。
-gt     检测左边的数是否大于右边的，如果是，则返回 true。    [ $a -gt $b ] 返回 false。
-lt     检测左边的数是否小于右边的，如果是，则返回 true。    [ $a -lt $b ] 返回 true。
-ge     检测左边的数是否大等于右边的，如果是，则返回 true。  [ $a -ge $b ] 返回 false。
-le     检测左边的数是否小于等于右边的，如果是，则返回 true。[ $a -le $b ] 返回 true。
'
# 内存使用状态提取
free_used=$(free -m | grep "内存" | awk '{print $3/$2*100}')
echo ${free_used%.*}
if [ ${free_used%.*} -ge 40 ]
then
	echo "主机内存使用超过了40%，当前已经使用了${free_used%.*}%"
else
	echo "当前内存足够使用"
fi
