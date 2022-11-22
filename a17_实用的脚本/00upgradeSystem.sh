#!/bin/bash
#======================================
# File name:shell_000upgrade_system.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 18:29
#======================================
#!/bin/bash
echo -e "\n$(date "+%Y-%m-%d-%T") --- 开始工作\n" 

apt-get update
apt-get -y upgrade

apt-get -y autoremove
apt-get autoclean

echo -e "\n$(date "+%Y-%m-%d-%T") --- 结束工作\n" 
