#!/bin/bash
#======================================
# File name:shell_02.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 09:32
#======================================
#使用变量
#使用一个定义过的变量，只要在变量名前面加美元符号（$）即可，如：
your_name="liangliangSu"
echo $your_name
echo ${your_name}
#变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界，
#比如下面这种情况：
for skill in Ada Coffe Action Java
    do
        echo "I am good at ${skill}Script"
    done
echo '--------------------------------------------------------------------'
for skill in Ada Coffe Action Java
    do
        echo "I am good at $skillScript"
    done
#如果不给 skill 变量加花括号，写成 echo "I am good at $skillScript"，
#解释器就会把 $skillScript 当成一个变量（其值为空），代码执行结果就不是我们期望的样子了
#推荐给所有变量加上花括号，这是个好的编程习惯。

