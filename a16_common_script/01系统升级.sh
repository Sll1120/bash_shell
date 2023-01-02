#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:23
# * Filename : 01系统升级.sh 
# **********************************************************
echo -e "\n$(date "+%Y-%m-%d-%T") --- 开始工作\n" 
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get autoclean
echo -e "\n$(date "+%Y-%m-%d-%T") --- 结束工作\n" 
