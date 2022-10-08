#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-09-26 11:37
# * Filename : func1.sh
# **********************************************************
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
