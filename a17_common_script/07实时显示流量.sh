#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:55
# * Filename : 07实时显示流量.sh
# **********************************************************
# 使用死循环实时显示 eth0 网卡发送的数据包流量 

while :
do 
 echo '本地网卡 enp0s3 下载流量是：'
 ifconfig enp0s3 | grep "RX pack" | awk '{print $5} Bytes/sec '
 echo '本地网卡 enp0s3 上载流量是：'
 ifconfig enp0s3 | grep "TX pack" | awk '{print $5} Bytes/sec'
 sleep 1
 echo '----------------------------------------------'
done

