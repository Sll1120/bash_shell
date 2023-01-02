#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 15:54
# * Filename : 46解析日期和时间.sh
# **********************************************************
year=`date +%Y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`
second=`date +%S`
echo `date`
echo "Current Date is: $year-$month-$day"
echo "Current Time is: $hour:$minute:$second"
