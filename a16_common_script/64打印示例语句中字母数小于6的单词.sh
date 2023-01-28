#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-28 22:18
# * Filename : 64打印示例语句中字母数小于6的单词.sh
# **********************************************************
#shell打印示例语句中字母数小于6的单词
for s in Bash also interprets a number of multi-character options.; do
	n=$(echo $s | wc -c)
	if [ $n -lt 6 ]; then
		echo $s
	fi
done
