#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 16:35
# * Filename : 46judge_file_dir_exist.sh
# **********************************************************
if [ $# -eq 0 ]; then
	echo "未输入任何参数,请输入参数"
	echo "用法:$0 [文件名|目录名]"
fi
if [ -f $1 ]; then
	echo "该文件,存在"
	ls -l $1
else
	echo "没有该文件"
fi
if [ -d $2 ]; then
	echo "该目录,存在"
	ls -ld $2
else
	echo "没有该目录"
fi
