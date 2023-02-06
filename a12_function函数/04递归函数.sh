#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-19 18:49
# * Filename : 04递归函数.sh
# **********************************************************
#递归函数是一个调用自身的函数。阶乘计算是递归函数的经典例子，看下面的脚本 factorial.sh：
factorial () {
    if [ $1 -le 1 ]; then
        echo 1
    else
        last=$(factorial $(( $1 -1)))
        echo $(( $1 * last ))
    fi
}

echo -n "4! is: "
factorial 4
echo -n "5! is: "
factorial 5
echo -n "6! is: "
factorial 6

#任何递归函数都要从一个基本条件开始，这个基本条件必须可以结束递归函数调用链。在 factorial() 函数中，基本条件为：
#if [ $1 -le 1 ]; then
#    echo 1

#然后导出阶乘函数的递归情况。要计算 n 的阶乘，其中 n 是大于 1 的正数，可以将 n 乘以 n-1 的阶乘：
#factorial(n) = n * factorial(n-1)
#使用上面那个公式来编写递归函数的算法：

#last=$(factorial $(( $1 -1)))
#    echo $(( $1 * last ))

#然后运行一下，检查运行结果：
#$ ./factorial.sh
#4! is: 24
#5! is: 120
#6! is: 720
