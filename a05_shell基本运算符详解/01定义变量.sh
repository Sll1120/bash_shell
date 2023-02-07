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

#只读变量
#使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
#下面的例子尝试更改只读变量，结果报错：
myUrl="http://see.xidian.edu.cn/cpp/shell/"
readonly myUrl
myUrl="http://see.xidian.edu.cn/cpp/danpianji/"
echo "(0)------------------------------------------------------------"

#删除变量
#使用 unset 命令可以删除变量。语法：
#unset variable_name
#变量被删除后不能再次使用；unset 命令不能删除只读变量。
#举个例子：
myUrl="http://see.xidian.edu.cn/cpp/u/xitong/"
unset myUrl
echo $myUrl
echo "(1)------------------------------------------------------------"

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

echo '--------------------------------------------------------------------'
#单引号---强引用（所见即所得，不会解析）
#双引号---弱引用（解析变量的值）
ng1=abc
echo $ng1
echo "$ng1 def"
# abc def
echo '$ng1 def'
# $ng1 def

#变量类型
#运行 shell 时，会同时存在三种变量： 
#1) 局部变量
#局部变量在脚本或命令中定义，仅在当前 shell 实例中有效，其他 shell 启动的程序不能访问局部变量。

#2) 环境变量
#所有的程序，包括 shell 启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候 shell 脚本也可以定义环境变量。
#可以通过env获取系统的全部系统变量

#3) shell 变量
#shell 变量是由 shell 程序设置的特殊变量。shell 变量中有一部分是环境变量，有一部分是局部变量，这些变量
#保证了 shell 的正常运行

#3-1) 位置参数边变量
#向脚本中进行参数传递，变量名不能自定义，变量作用是固定的
#3-2) 特殊参数变量
#是bash中已经定义好的变量，变量不能自定义，变量作用也是固定i的