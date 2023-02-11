#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-11 15:01
# * Filename : bacth_create_users.sh
# **********************************************************
#创建10个用户，并分别设置密码，密码要求10位且包含大小写字母以及数字
#最后需要把每个用户的密码存在指定文件中
#前提条件：安装mkpasswd命令

#生成10个用户的序列（00-09）
for u in $(seq -w 01 09); do
	#创建用户
	sudo useradd user_$u
	#生成密码
	p=$(mkpasswd -s 0)
	#从标准输入中读取密码进行修改（不安全）
	echo $p | sudo passwd --stdin user_$u
	#常规修改密码
	echo -e "$p\n$p" | sudo passwd user_$u
	#将创建的用户及对应的密码记录到日志文件中
	echo "user_$u $p" >>/tmp/userpassword
done

echo '(1)-----------------------完美分割线--------------------------------'
cat /etc/passwd | awk -F: '{print $1}'
#cat /etc/passwd |awk -F: '$4>=1000 {print $1,$4}'

for i in $(seq 9); do
	userdel user_0$i
done
rm -fr /home/user_0$i
