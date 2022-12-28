#!/bin/bash
#======================================
# File name:shell_01echo.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 12:52
#======================================
: '
echo 是 Shell 的一个内部指令，用于在屏幕上打印出指定的字符串。命令格式：
echo arg
您可以使用 echo 实现更复杂的输出格式控制。
'
#1)显示转义字符
echo "\"It is a test\""
#结果将是：
#"It is a test"
#双引号也可以省略。
#2)显示变量
name="OK"
echo "$name It is a test"
#结果将是：
#OK It is a test
#同样双引号也可以省略。
#3)如果变量与其它字符相连的话，需要使用大括号（{ }）：
mouth=8
echo "${mouth}-1-2009"
#结果将是：
#8-1-2009
#4)显示换行
echo "OK!\n"
echo "It is a test"
#输出：
#OK!
#It is a test
#显示不换行
echo "OK!\c"
echo "It is a test"
#输出：
#OK!It si a test
#5)显示结果重定向至文件
echo "It is a test" > z_01echo.txt
#6)若需要原样输出字符串（不进行转义），请使用单引号。
#例如：
echo '$name\"'
#显示命令执行结果
echo `date`
#结果将显示当前日期
#从上面可看出，双引号可有可无，单引号主要用在原样输出中。
echo "打印文本"
echo -n "打印不带换行符的文本"
echo -e "\n删除\t特殊\t字符\n"
