#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-22 22:47
# * Filename : 统计根分区使用率.sh
# **********************************************************
rate=$(df -h | grep "dev/sda3" | awk '{print $5}' | cut -d "%" -f1)
# 把根分区使用率作为变量赋予变量rate
echo "$rate%" 
if [ $rate -ge 80 ]
  then
    echo "Warning! /dev/sda3 is nearly full!!"
fi

