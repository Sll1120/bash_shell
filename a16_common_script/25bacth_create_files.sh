#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 14:56
# * Filename : create_files.sh
# **********************************************************
# 方法1
source /etc/profile
#if [ ! -d /home/sll/git/shell/a16_common_script ]; then
#	mkdir -p /home/sll/git/shell/a16_common_script
for num in {1..9}; do
	touch $PWD/sll_${num}.txt #因为创建文件到指定目录，所以创建时最好用全路径；
done

# 方法2
for file in `cat z_example_1.txt | awk '{print $1}'`
do
    touch ${file}.sh
done

