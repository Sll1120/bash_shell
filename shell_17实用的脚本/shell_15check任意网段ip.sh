#!/bin/bash
#======================================
# File name:shell_15check任意网段ip.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 18:51
#======================================
read -p "请输入你需要检测的网段IP地址前3数字:" num
for HOST in $(seq 1 254)
do
#ping -c 1 $num.$HOST > /dev/null && result=0 || result=1
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

