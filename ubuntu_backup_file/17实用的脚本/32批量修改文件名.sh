#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 16:29
# * Filename : 1.sh
# **********************************************************
#for file in ` ls -d $(ls --file-type | grep ".*/$") -l `  #批量修改目录名
for file in ` ls -d $(ls --file-type | grep ".*[^/]$") -l ` #批量修改文件名
do
	mv ${file}  ` echo $file | sed 's/shell_//g' `   #sed命令进行文件名替换
done

