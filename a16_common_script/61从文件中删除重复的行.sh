#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 23:19
# * Filename : 61从文件中删除重复的行.sh
# **********************************************************
echo -n "Enter Filename-> "
read filename
if [ -f "$filename" ]; then
	sort $filename | uniq | tee z_sorted.txt
else
	echo "No $filename in $pwd...try again"
fi
exit 0

