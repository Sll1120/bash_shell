#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 17:02
# * Filename : 32break_continue_difference.sh
# **********************************************************
: 'break 和 continue 语句
  break 是终止循环。
  continue 是跳出当前循环。
  '
echo "(1)-----------------------------------------------"
#示例 1：在死循环中，满足条件终止循环
while true; do
	let N++
	if [ $N -eq 5 ]; then
		break
	fi
	echo -e "$N\n"
done
#输出：1 2 3 4

echo "(2)-----------------------------------------------"
#示例 2：举例子说明 continue 用法
N=0
while [ $N -lt 5 ]; do
	let N++
	if [ $N -eq 3 ]; then
		continue
	fi
	echo -e "$N\n"
done
#输出：1 2 4 5	

echo "(3)-----------------------------------------------"
#示例 3: 打印 1-20 数字
i=0
while ((i <= 20)); do
	echo -e "$i"
	i=$(expr $i + 1)
done

