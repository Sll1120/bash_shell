#!/bin/bash

# 使用死循环实时显示 eth0 网卡发送的数据包流量 

while :
do 
 echo '本地网卡 ens33 下载流量是：'
 ifconfig ens33 | grep "RX pack" | awk '{print $5} Bytes/sec '
 echo '本地网卡 ens33 上载流量是：'
 ifconfig ens33 | grep "TX pack" | awk '{print $5} Bytes/sec'
 sleep 1
 echo '----------------------------------------------'
done
