#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-28 21:46
# * Filename : 优秀运维脚本鉴赏.sh
# **********************************************************
# Function: 根据用户输入的PID，过滤出该PID所有的信息
read -p "请输入要查询的PID: " P
n=$(ps -aux | awk '$2~/^'$P'$/{print $11}' | wc -l)
if [ $n -eq 0 ]; then
	echo "该PID不存在！！"
	exit
fi
echo "(1)-------------------------------------------------------------------"
echo "进程PID: $P"
echo "进程命令：$(ps -aux | awk '$2~/^'$P'$/{print $11}')"
echo "进程所属用户: $(ps -aux | awk '$2~/^'$P'$/{print $1}')"
echo "CPU占用率：$(ps -aux | awk '$2~/^'$P'$/{print $3}')%"
echo "内存占用率：$(ps -aux | awk '$2~/^'$P'$/{print $4}')%"
echo "进程开始运行的时刻：$(ps -aux | awk '$2~/^'$P'$/{print $9}')"
echo "进程运行的时间：$(ps -aux | awk '$2~/^'$P'$/{print $10}')"
echo "进程状态：$(ps -aux | awk '$2~/^'$P'$/{print $8}')"
echo "进程虚拟内存：$(ps -aux | awk '$2~/^'$P'$/{print $5}')"
echo "进程共享内存：$(ps -aux | awk '$2~/^'$P'$/{print $6}')"

echo "(2)-------------------------------------------------------------------"
read -p "请输入要查询的进程名：" NAME
N=$(ps -aux | grep $NAME | grep -v grep | wc -l) ##统计进程总数
if [ $N -le 0 ]; then
	echo "该进程名没有运行！"
fi
i=1
while [ $N -gt 0 ]; do
	echo "进程PID: $(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $2}')"
	echo "进程命令：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $11}')"
	echo "进程所属用户: $(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $1}')"
	echo "CPU占用率：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $3}')%"
	echo "内存占用率：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $4}')%"
	echo "进程开始运行的时刻：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $9}')"
	echo "进程运行的时间：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $11}')"
	echo "进程状态：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $8}')"
	echo "进程虚拟内存：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $5}')"
	echo "进程共享内存：$(ps -aux | grep $NAME | grep -v grep | awk 'NR=='$i'{print $0}' | awk '{print $6}')"
	let N-- i++
done
echo "(3)-------------------------------------------------------------------"
# Function：根据用户名查询该用户的所有信息
read -p "请输入要查询的用户名：" A
n=$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | wc -l)
if [ $n -eq 0 ]; then
	echo "该用户不存在"
else
	echo "该用户的用户名：$A"
	echo "该用户的UID：$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $3}')"
	echo "该用户的组为：$(id $A | awk {'print $3'})"
	echo "该用户的GID为：$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $4}')"
	echo "该用户的家目录为：$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $6}')"
	Login=$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $7}')
	if [ $Login == "/bin/bash" ]; then
		echo "该用户有登录系统的权限！！"
	elif [ $Login == "/sbin/nologin" ]; then
		echo "该用户没有登录系统的权限！！"
	fi
fi
echo "(4)-------------------------------------------------------------------"

