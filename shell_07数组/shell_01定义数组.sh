#!/bin/bash
#======================================
# File name:shell_01定义数组.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 12:27
#======================================
: '
Shell 在编程方面比 Windows 批处理强大很多，无论是在循环、运算。
bash 支持一维数组（不支持多维数组），并且没有限定数组的大小。类似与 C 语言，数组元素的下标由0开始编
号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于0。
定义数组
在 Shell 中，用括号来表示数组，数组元素用“空格”符号分割开。定义数组的一般形式为：
array_name=(value1 ... valuen)
例如：
array_name=(value0 value1 value2 value3)
或者
array_name=(
value0
value1
value2
value3
)
还可以单独定义数组的各个分量：
array_name[0]=value0
array_name[1]=value1
array_name[2]=value2
可以不使用连续的下标，而且下标的范围没有限制。
'
