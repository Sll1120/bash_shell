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
echo -e "----------gitee 服务器推送 success !------------"

sleep 2
#git push github master
git push -u github +master
echo -e "----------github 服务器推送 success !------------"
