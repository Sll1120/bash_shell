#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:23
# * Filename : 01系统升级.sh 
# **********************************************************
echo -e "\n$(date "+%Y-%m-%d-%T") --- 开始工作\n" 

sudo apt-get remove thunderbird simple-scan simple-scan 
\gnome-mahjongg aisleriot gnome-mines cheese transmission-common 
\gnome-orca gnome-sudoku  totem rhythmbox onboard deja-dup libreoffice-common

sudo apt-get install vim vpnc git axel openssh-server 
\cmake qtcreator build-essential gdb axel lnav unrar net-tools terminator

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get autoclean

echo -e "\n$(date "+%Y-%m-%d-%T") --- 结束工作\n" 
