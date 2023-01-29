#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 16:45
# * Filename : 07.sh
# **********************************************************
: '
退出状态
$? 可以获取上一个命令的退出状态。所谓退出状态，就是上一个命令执行后的返回结果。
退出状态是一个数字，一般情况下，大部分命令执行成功会返回0，失败返回1。
不过，也有一些命令返回其他值，表示不同类型的错误。
'
#下面例子中，命令成功执行：
#$./test.sh Zara Ali
#File Name : ./test.sh
#First Parameter : Zara
#Second Parameter : Ali
#Quoted Values: Zara Ali
#Quoted Values: Zara Ali
#Total Number of Parameters : 2
#$echo $?
#0
#$
#$? 也可以表示函数的返回值，后续将会讲解。
