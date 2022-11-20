#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-20 21:37
# * Filename : 06check_script.sh
# **********************************************************
bash 05check_ip.sh
EXCODE=$?
if [ "$EXCODE" == "0" ]; then
echo "OK"
else echo "脚本运行有报错"
fi
