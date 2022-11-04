#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-03 16:00
# * Filename : find_strings.sh
# **********************************************************
files=`find . -name "*.csv"`         #寻找csv类型的文件
for file in $files                   #遍历files
do
	#grep $1 $file | awk -F, '{print $2,$3,$5,$6}'      #将输入参数1与当前文件内容进行匹配
	grep $1 $file | awk -F, '{print $2,$5,$6}'      #将输入参数1与当前文件内容进行匹配
done
