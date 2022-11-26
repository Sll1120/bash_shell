#!/bin/bash
#======================================
# File name:shell_07源码安装memcached.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 14:09
#======================================
#!/bin/bash
# 一键部署 memcached 
# 脚本用源码来安装 memcached 服务器
# 注意:如果软件的下载链接过期了,请更新 memcached 的下载链接
wget http://www.memcached.org/files/memcached-1.5.1.tar.gz
sudo apt install -y gcc
tar -xf  memcached‐1.5.1.tar.gz
cd memcached‐1.5.1
./configure
make
make install
