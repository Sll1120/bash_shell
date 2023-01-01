#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:23
# * Filename : 00upgrade_system.sh
# **********************************************************
echo -e "\n$(date "+%Y-%m-%d-%T") --- 开始工作\n" 

apt-get update
apt-get -y upgrade
apt-get -y autoremove
apt-get autoclean

echo -e "\n$(date "+%Y-%m-%d-%T") --- 结束工作\n" 
