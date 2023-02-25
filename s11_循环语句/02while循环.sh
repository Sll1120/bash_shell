#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 15:11
# * Filename : 02while循环.sh
# **********************************************************
: '
因此，while 循环采用以下形式。
while [ condition ]
do
commands 1
commands n
done
'
i=0
while [ $i -le 2 ]; do
	echo Number: $i
	((i++))
done
echo "---------------------------------------------------------"
s=0
i=1
while [ $i -le 100 ]; do
	s=$(($s + $i))
	i=$(($i + 1))
done
echo $s
echo $i

