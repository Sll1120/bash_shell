#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 16:17
# * Filename : 06and运算符.sh
# **********************************************************
echo -n "Enter Number:"
read num

if [[ ($num -lt 10) && ($num%2 -eq 0) ]]; then
	echo "Even Number"
else
	echo "Odd Number"
fi

