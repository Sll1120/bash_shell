#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-09-20 16:46
# * Filename : push_gitee.sh
# **********************************************************
git add .
git commit -m "change v1.$1"
git push gitee master
