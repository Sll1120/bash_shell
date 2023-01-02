#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 14:56
# * Filename : create_files.sh
# **********************************************************
source /etc/profile
if [ ! -d /home/sll/git/shell/a17_common_script ]; then
	mkdir -p /home/sll/git/shell/a17_common_script
fi

for num in {1..9}; do
	touch /home/sll/git/shell/a17_common_script/sll_${num}.txt #因为创建文件到指定目录，所以创建时最好用全路径；
done
