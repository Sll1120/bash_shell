#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 12:04
# * Filename : 15check_ip_status.sh
# **********************************************************
read -p "请输入你需要检测的网段IP地址前3数字:" num
#for HOST in $(seq 1 254)
for HOST in $(seq 1 24)
do
ping -c 1 $num.$HOST > /dev/null

#if [ "$result" == 0 ];then
if [ $? == 0 ];then
  echo -e "\e[32;1m$num.$HOST is up \e[0m"
  echo "$num.$HOST" >> /tmp/up.txt

else
  echo -e "\e[;31m$num.$HOST is down \e[0m"
  echo "$num.$HOST" >> /tmp/down.txt
fi
done
