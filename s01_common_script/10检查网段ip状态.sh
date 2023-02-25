#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 12:04
# * Filename : 15check_ip_status.sh
# **********************************************************
echo "(1)---------------------------------------------------"
# 编写脚本测试 x.x.x.0/xxx 整个网段中哪些主机处于开机状态,哪些主机处于关机
read -p "请输入你需要检测的网段IP地址前3数字:" num
#for HOST in $(seq 1 254)
for HOST in $(seq 99 105); do
	ping -c 2 -i 0.3 -W 1 $num.$HOST &>/dev/null

	#if [ "$result" -eq 0 ];then
	if [ $? -eq 0 ]; then
		echo -e "\e[32m$num.$HOST is up \e[0m"
		echo "$num.$HOST" >>/tmp/up.txt

	else
		echo -e "\e[31m$num.$HOST is down \e[0m"
		echo "$num.$HOST" >>/tmp/down.txt
	fi
done

echo "(2)---------------------------------------------------"
# 编写脚本测试 x.x.x.0/20 整个网段中哪些主机处于开机状态,哪些主机处于关机
# 状态(for 版本)
for i in {99..105}; do
	# 每隔0.3秒ping一次，一共ping2次，并以1毫秒为单位设置ping的超时时间
	ping -c 2 -i 0.3 -W 1 192.168.1.$i &>/dev/null
	if [ $? -eq 0 ]; then
		echo -e "\e[32m 192.168.1.$i is up \e[0m"
		echo "10.0.2.$i" >>/tmp/up.txt
	else
		echo -e "\e[31m 192.168.1.$i is down \e[0m"
		echo "10.0.2.$i" >>/tmp/down.txt
	fi
done

echo "(3)---------------------------------------------------"
#判断ip的是否符合规则
function check_ip() {
	IP=$1
	VALID_CHECK=$(echo $IP | awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
	if echo $IP | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
		if [[ ${VALID_CHECK} == "yes" ]]; then
			echo "$IP available."
		else
			echo "$IP unavailable!"
		fi
	else
		echo "Format error!"
	fi
}
check_ip 10.0.2.2
check_ip 256.1.1.1

echo "(4)---------------------------------------------------"
#判断ip的是否符合规则
function check_ip() {
	IP=$1
	if [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		FIELD1=$(echo $IP | cut -d. -f1)
		FIELD2=$(echo $IP | cut -d. -f2)
		FIELD3=$(echo $IP | cut -d. -f3)
		FIELD4=$(echo $IP | cut -d. -f4)
		if [ $FIELD1 -le 255 -a $FIELD2 -le 255 -a $FIELD3 -le 255 -a $FIELD4 -le 255 ]; then
			echo "$IP available."
		else
			echo "$IP unavailable!"
		fi
	else
		echo "Format error!"
	fi
}
check_ip 10.0.2.2
check_ip 256.1.1.1

echo "(5)---------------------------------------------------"
#判断ip的是否符合规则
function check_ip() {
	local IP=$1
	VALID_CHECK=$(echo $IP | awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
	if echo $IP | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
		if [[ ${VALID_CHECK} == "yes" ]]; then
			echo -e "\e[32m $IP available! \e[0m"
			return 0
		else
			echo -e "\e[31m $IP unavailable! \e[0m"
			return 1
		fi
	else
		echo "Format error! Please input again."
		return 1
	fi
}
while true; do
	read -p "Please enter IP: " IP
	check_ip $IP
	[ $? -eq 0 ] && break || continue
done
