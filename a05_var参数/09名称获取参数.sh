#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 16:47
# * Filename : 09名称获取参数.sh
# **********************************************************
for arg in "$@"; do
	index=$(echo $arg | cut -f1 -d=)
	val=$(echo $arg | cut -f2 -d=)
	case $index in
	X) x=$val ;;
	Y) y=$val ;;
	*) ;;
	esac
done
((result = x + y))
echo "X+Y=$result"

#./test.sh X=44 Y=100
#它应该返回 X+Y=144。此处的参数存储在“ $@ ”中，脚本使用 Linux cut 命令获取它们。
