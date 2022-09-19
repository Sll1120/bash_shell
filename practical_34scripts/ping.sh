#!/bin/bash
# by suliangliang on 2022-8-1
#Remark:ping ip address up or down
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
