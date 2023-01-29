#!/bin/bash
#======================================
# file name:shell01定义变量.sh
# author:liangliangSu
# date of writing:2022-10-06 01:11
#======================================
: '
定义变量
定义变量时，变量名不加美元符号（$），如：
variableName="value"
注意，变量名和等号之间不能有空格，这可能和你熟悉的所有编程语言都不一样。同时，变量名的命名须遵循如下规则：
- 首个字符必须为字母（a-z，A-Z）。 
- 中间不能有空格，可以使用下划线（_）。
- 不能使用标点符号。 
- 不能使用 bash 里的关键字（可用 help 命令查看保留关键字）。
变量定义举例：
'
myUrl="http://see.xidian.edu.cn/cpp/linux/"
myNum=100
echo "myUrl"
echo "myNum"

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

#重新定义变量
#已定义的变量，可以被重新定义，如：
myUrl="http://see.xidian.edu.cn/cpp/linux/"
echo ${myUrl}
myUrl="http://see.xidian.edu.cn/cpp/shell/"
echo ${myUrl}
#这样写是合法的，但注意，第二次赋值的时候不能写:
#$myUrl="http://see.xidian.edu.cn/cpp/shell/"，
#使用变量的时候才加美元符（$）。

