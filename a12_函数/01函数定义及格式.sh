#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-13 23:27
# * Filename : 01函数定义及格式.sh
# **********************************************************
: '
函数可以让我们将一个复杂功能划分成若干模块，让程序结构更加清晰，代码重复利用率更高。像其他编程语言
一样，Shell 也支持函数。Shell 函数必须先定义后使用。
Shell 函数的定义格式如下：
function_name () {
    list of commands
    [ return value ]
}

如果你愿意，也可以在函数名前加上关键字 function：
#函数定义
[ function ] function_name [()]
{
    #函数体
    command
    [return int]
}

#函数调用
function_name arg1 arg2 ....
注：[]是可选部分
#函数返回值，可以显式增加 return 语句；如果不加，会将最后一条命令运行结果作为返回值。
'
#Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。
#如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。
#先来看一个例子：
echo '(1)-----------------------完美分割线--------------------------------'
#!/bin/bash
# Define your function here
Hello () {
    echo "Url is http://see.xidian.edu.cn/cpp/shell/"
}
    # Invoke your function
Hello
#调用函数只需要给出函数名，不需要加括号。
#再来看一个带有 return 语句的函数：
echo '(2)-----------------------完美分割线--------------------------------'
#!/bin/bash
funWithReturn(){
    echo "The function is to get the sum of two numbers..."
    echo -n "Input first number: "
    read aNum
    echo -n "Input another number: "
    read anotherNum
    echo "The two numbers are $aNum and $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
ret=$?
echo "The sum of two numbers is $ret !"
#函数返回值在调用该函数后通过 $? 来获得。
#再来看一个函数嵌套的例子：
echo '(3)-----------------------完美分割线--------------------------------'
#!/bin/bash
# Calling one function from another
number_one () {
    echo "Url_1 is http://see.xidian.edu.cn/cpp/shell/"
    number_two
}
number_two () {
    echo "Url_2 is http://see.xidian.edu.cn/cpp/u/xitong/"
}
number_one
number_two
#像删除变量一样，删除函数也可以使用 unset 命令，不过要加上 .f 选项，如下所示：
#$unset .f function_name
#如果你希望直接从终端调用函数，可以将函数定义在主目录下的 .profile 文件，这样每次登录后，在命令提示符
#后面输入函数名字就可以立即调用。

#函数定义
#10[ function ] function_name [()]
#{
#    #函数体
#    command
#    [return int]
#}
#
##函数调用
#function_name arg1 arg2 ....
echo '(4)-----------------------完美分割线--------------------------------'
#!/bin/bash
#定义函数
function show_name()
{
    echo $USER
}

#调用函数
show_name
#通过$n获取参数值
#$0获取脚本名称
#$1第一个参数
#$2第二个参数
#$3第三个参数
#以此类推
#超过十个参数使用${10}、${11}

#!/bin/bash
function show_args()
{
    echo "脚本名称:$0"
    echo "第一个参数:$1"
    echo "第二个参数:$2"
    echo "第三个参数:$3"
}
show_args arg1 arg2 arg3

