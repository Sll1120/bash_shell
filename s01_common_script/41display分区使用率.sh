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

#提取内存百分比脚本
#需求：如果使用率超过80%，触发报警并发邮件
#编写思路：
#如何查看内存指标？
#如何查看内存使用率百本分比？
#重点在于用最短删除匹配原则（从后往前删）来进行比对。
#查看内存的命令如下，获取百分比用used的值除以total总计再乘以100。
