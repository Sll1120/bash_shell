#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-09-20 16:46
# * Filename : push_github.sh
# **********************************************************
git add .
git commit -m "change V`date "+%Y-%m-%d %H:%M`"
git push gitee master
#git push -u gitee +master

