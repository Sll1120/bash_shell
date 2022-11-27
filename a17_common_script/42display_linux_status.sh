#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 23:26
# * Filename : 42display_linux_status.sh
# **********************************************************
#实时监控本机内存和硬盘剩余空间,剩余内存小于500M&根分区剩余空间小于1000M时,发送报警邮件给root管理员

# 提取根分区剩余空间
disk_size=$(df / | awk '/\//{print $4}')

# 提取内存剩余空间
mem_size=$(free | awk '/Mem/{print $4}')

while :
do
# 注意内存和磁盘提取的空间大小都是以 Kb 为单位
if  [ $disk_size -le 12000 ] && [ $mem_size -le 1024000 ]
then
#    mail  ‐s  "Warning"  root  <<EOF
#  Insufficient resources,资源不足
# EOF
	echo  -e "Insufficient resources,资源不足 \a" 
else
	echo -e "System status is normal"
fi
sleep 3
done
