#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 17:01
# * Filename : 53sleep命令.sh
# **********************************************************
#sleep 命令允许您的 shell 脚本在指令之间暂停。它在许多场景中都很有用，例如执行系统级作业。
#该程序暂停最后一条指令的执行，直到$time秒，在这种情况下用户提供。
echo "How long to wait?"
read time
sleep $time
echo "Waited for $time seconds!"

