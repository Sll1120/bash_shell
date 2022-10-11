#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 14:56
# * Filename : create_files.sh
# **********************************************************
source /etc/profile
if [ ! -d /home/sll/gitee/shell/shell_21commands ];
then
	mkdir -p /shell_21commands
fi

for  num in {1..10}
do
	touch //home/sll/gitee/shell/shell_21commands/sll_${num}.txt   #因为创建文件到指定目录，所以创建时最好用全路径；
done




