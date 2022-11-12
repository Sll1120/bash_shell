#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-08 11:15
# * Filename : shell_02系统函数.sh
# **********************************************************
: '
basename获取文件名
基本语法
basename [pathname] [suffix]
功能描述：basename 命令会删掉所有的前缀包括最后一个（‘/’）字符，然后将字符串显示出来。
选项：suffix 为后缀，如果 suffix 被指定了，basename 会将 pathname 或 string 中的 suffix 去掉。
'
#示例
basename /etc/vim/vimrc.tiny  #获取vimrc.tiny
basename /etc/vim/vimrc.tiny .tiny  #获取vimrc(删除了.tiny)

: '
#dirname获取文件的绝对路径的目录
#基本语法
#dirname [filepath]
#功能描述：从给定的包含绝对路径的文件名中去除文件名（非目录的部分），然后返回剩下的路径（目录的部分）
'
#示例
dirname /home/sll/.bashrc   #获取 /home/sll
