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
echo "start push code to github"
git push -u github +master
echo "start push code to gitee"
git push -u gitee +master
