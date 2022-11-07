#!/bin/bash
#======================================
# File name:shell_05.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 09:39
#======================================
#删除变量
#使用 unset 命令可以删除变量。语法：
#unset variable_name
#变量被删除后不能再次使用；unset 命令不能删除只读变量。
#举个例子：
#!/bin/sh
myUrl="http://see.xidian.edu.cn/cpp/u/xitong/"
unset myUrl
echo $myUrl
#上面的脚本没有任何输出。
