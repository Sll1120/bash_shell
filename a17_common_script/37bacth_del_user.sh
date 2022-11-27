#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 22:58
# * Filename : 37bacth_del_user.sh
# **********************************************************
for i in `seq 9`; do
userdel sll0$i
done
userdel sll10
rm -fr /home/sll0$i
rm -fr /home/sll10
