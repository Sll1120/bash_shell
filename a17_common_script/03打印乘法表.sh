#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:39
# * Filename : 03print99乘法表.sh
# **********************************************************
for i in $(seq 9); do
	for j in $(seq $i); do
		echo -n "$j*$i=$((i * j)) "
	done
	echo
done
