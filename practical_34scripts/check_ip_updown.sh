#!/bin/bash
#by author suliangliang on 2022-08-07
# 编写脚本测试 192.168.4.0/24 整个网段中哪些主机处于开机状态,哪些主机处于关机
# 状态(for 版本)
for i in {1..254}
do 
 # 每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
 ping -c 2 -i 0.3 -W 1 192.168.1.$i &>/dev/null
if [ $? -eq 0 ];then
	echo -e "\e[32m192.168.1.$i is up\e[0m"
else
	echo -e "\e[31m192.168.1.$i is down\e[0m"
fi
done
