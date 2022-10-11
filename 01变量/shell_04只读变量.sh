#!/bin/bash
#======================================
# File name:shell_03只读变量.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 09:30
#======================================
#只读变量
#使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
#下面的例子尝试更改只读变量，结果报错：
#!/bin/bash
myUrl="http://see.xidian.edu.cn/cpp/shell/"
readonly myUrl
myUrl="http://see.xidian.edu.cn/cpp/danpianji/"
#运行脚本，结果如下：
#/bin/sh: NAME: This variable is read only.
