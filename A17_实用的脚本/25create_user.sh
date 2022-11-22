#!/bin/bash
#======================================
# File name:shell_25create_user.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 19:13
#======================================
#!/bin/bash

# 通过位置变量创建Linux 系统账户及密码

# $1 是执行脚本的第一个参数，$2  是执行脚本的第二个参数

useradd "$1"
echo "$2" | passwd --stdin "$1"
