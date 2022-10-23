#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-20 11:07
# * Filename : 13awk_数组.sh
# **********************************************************
#数组
netstat -anp|awk 'NR!=1{a[$6]++} END{for (i in a) print i,"\t",a[i]}'
netstat -anp|awk 'NR!=1{a[$6]++} END{for (i in a) printf "%-20s %-10s %-5s \n", i,"\t",a[i]}'

