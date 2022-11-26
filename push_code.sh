#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-09 19:14
# * Filename : push_gitee.sh
# **********************************************************
git add .
git commit -m "Released in `date "+%Y-%m-%d %H:%M"`"
#git push github master
#git push gitee master
echo -e "\033[31m start push code to github.\033[0m"
sleep 1
git push -u github +master
echo -e "\033[31m start push code to gitee.\033[0m"
sleep 1
git push -u gitee +master
