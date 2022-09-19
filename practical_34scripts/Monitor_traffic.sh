#!/bin/bash

# 使用死循环实时显示 eth0 网卡发送的数据包流量 

while :
do 
 echo '本地网卡 ens33 流量信息如下：'
 ifconfig ens33 | grep "RX pack" | awk '{print $5}'
     ifconfig ens33 | grep "TX pack" | awk '{print $5}'
 sleep 1
done
