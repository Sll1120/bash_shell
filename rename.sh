#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 16:29
# * Filename : rename.sh
# **********************************************************
#for file in ` ls -d $(ls --file-type | grep ".*/$") -l `  #批量修改目录名
#for file in ` ls -d $(ls --file-type | grep ".*[^/]$") -l ` #批量修改文件名
#do
#	mv ${file}  ` echo $file | sed 's/shell_//g' `   #sed命令进行文件名替换
#done
files=`find . -type d -name  "A*"`         #寻找csv类型的文件
for file in $files                   #遍历files
do
	#grep $1 $file | awk -F, '{print $2,$5,$6}'      #将输入参数1与当前文件内容进行匹配
	mv ${file}  ` echo $file | sed 's/A/a/g' `   #sed命令进行文件名替换
done
