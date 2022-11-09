#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-03 16:00
# * f1name : find_strings.sh
# **********************************************************
#第一步修改文件名
#files=`find . -name "*.csv"`         #寻找csv类型的文件
#for f1 in $files                   #遍历files
#do
#	mv $f1 `echo ${f1#*_}`
#done
#第二部查找字符串
files=`find . -name "*.csv"`         #寻找csv类型的文件
for f2 in $files                   #遍历files
do
	#grep $1 $f2 | awk -F, '{print $2,$5,$6}'      #将输入参数1与当前文件内容进行匹配
	grep $1 $f2 
done
