#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 15:11
# * Filename : 06while循环.sh
# **********************************************************
#!/bin/bash
i=0
while [ $i -le 2 ]; do
	echo Number: $i
	((i++))
done

: '
因此，while 循环采用以下形式。
while [ condition ]
do
commands 1
commands n
done
'
