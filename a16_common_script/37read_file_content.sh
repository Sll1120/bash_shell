#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-01 11:48
# * Filename : 读取文件内容.sh
# **********************************************************
file='z_editors.txt'
while read line; do
	echo $line
done <$file

