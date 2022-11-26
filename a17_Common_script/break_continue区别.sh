#!/bin/bash
: 'break 和 continue 语句
  break 是终止循环。
  continue 是跳出当前循环。
  '
#示例 1：在死循环中，满足条件终止循环
while true; do
  let N++
  if [ $N -eq 5 ]; then
    break
fi
  echo -e "$N\n"
done
#输出：1 2 3 4
#示例 2：举例子说明 continue 用法
N=0
while [ $N -lt 5 ]; do
  let N++
if [ $N -eq 3 ]; then
  continue
fi
  echo -e "$N\n"
done
#输出：1 2 4

# 打印 1-100 数字
i=0
while ((i<=100))
do
	echo  -e "$i"
        i=`expr $i + 1`
done
