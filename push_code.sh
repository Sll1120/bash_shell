#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-09 19:14
# * Filename : push_gitee.sh
# **********************************************************
git add .
git commit -m "Released in `date "+%Y-%m-%d %H:%M"`"
echo -e "\033[32m start push code to gitee.\033[0m"
sleep 1
#git push gitee master
git push -u gitee +master

#git add .
#git commit -m "Released in `date "+%Y-%m-%d %H:%M"`"
#echo -e "\033[32m start push code to github.\033[0m"
#sleep 1
#git push github master
#git push -u github +master
