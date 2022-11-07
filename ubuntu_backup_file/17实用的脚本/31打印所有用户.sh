#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 16:20
# * Filename : shell_31打印所有用户.sh
# **********************************************************
cat /etc/passwd |awk  '{print $1,$2,$3,$4}'
echo '+++++++++++++++++++++++++++++++++++++++++++++++++++++'
cat /etc/passwd |awk -F: '$4>=1000 {print $1,$4}'

