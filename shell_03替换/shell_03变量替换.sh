#!/bin/bash
#======================================
# File name:shell_02变量替换.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 10:21
#======================================
: '
变量替换
变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值
可以使用的变量替换形式：
形式                说明
${var}              变量本来的值
${var:-word}        如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值
${var:=word}        如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。
${var:?message}     如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标 准错误输出，可以用来检测变量 var 是否可以被正常赋值。若此替换出现在 Shell 脚本中，那么脚本将停止运行。
${var:+word}        如果变量 var 被定义，那么返回 word，但不改变 var 的值。
'
#请看下面的例子：
#!/bin/bash
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

