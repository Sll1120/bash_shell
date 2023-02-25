#!/bin/bash
#======================================
# File name:shell_04break循环.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 00:34
#======================================
: '
在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，
像大多数编程语言一样，Shell 也使用 break 和 continue 来跳出循环。
break 命令
break 命令允许跳出所有循环（终止执行后面的所有循环）。
'
#下面的例子中，脚本进入死循环直至用户输入数字大于5。要跳出这个循环，返回到 shell 提示符下，就要使用 break 命令。
#!/bin/bash
while :
do
    echo -n "Input a number between 1 to 5: "
    read num
    case $num in
    1|2|3|4|5) echo "Your number is $num!"
    ;;
    *) echo "You do not select a number between 1 to 5, game is over!"
        break
    ;;
    esac
done
#在嵌套循环中，break 命令后面还可以跟一个整数，表示跳出第几层循环。例如： break n 表示跳出第 n 层循环。

#下面是一个嵌套循环的例子，如果 var1 等于2，并且 var2 等于0，就跳出循环：
#!/bin/bash
for var1 in 1 2 3
do
    for var2 in 0 5
    do
    if [ $var1 -eq 2 -a $var2 -eq 0 ]
    then
        break 2
    else
        echo "$var1 $var2"
    fi
    done
done
#如上，break 2 表示直接跳出外层循环。运行结果：
#1 0
#1 5
