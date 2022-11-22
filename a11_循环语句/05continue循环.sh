#!/bin/bash
#======================================
# File name:shell_05continue循环.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 00:45
#======================================
: '
continue 命令
continue 命令与 break 命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
'
#看一个 continue 的例子：
#!/bin/bash
NUMS="1 2 3 4 5 6 7"
for NUM in $NUMS
do
    Q=`expr $NUM % 2`
    if [ $Q -eq 0 ]
    then
        echo "${NUM} Number is an even number!!"
        continue
    fi
     echo "${NUM} Number is an odd number!!"
done
#运行结果：
#1 Number is an odd number!!
#2 Number is an even number!!
#3 Number is an odd number!!
#4 Number is an even number!!
#5 Number is an odd number!!
#6 Number is an even number!!
#7 Number is an odd number!!
#----------------------------------------
#!/bin/bash
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
    1|2|3|4|5) echo "Your number is $aNum!"
    ;;
    *) echo "You do not select a number between 1 to 5!"
         continue
        echo "Game is over!"
    ;;
    esac
done
#运行代码发现，当输入大于5的数字时，该例中的循环不会结束，语句 echo "Game is over!" 永远不会被执行。
#同样，continue 后面也可以跟一个数字，表示跳出第几层循环。
