#!/bin/bash
#======================================
# File name:create_user.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 19:13
#======================================
if [ $USER == "root" ] 
then 
seq -w 10|sed -r "s/(.*)/useradd sll\1/g" | bash
echo sll{01..10}:$((RANDOM))|tr " " "\n" > z_user.log 
chpasswd < z_user.log 
else 
 echo "您不是管理员，没有权限安装软件"
fi
