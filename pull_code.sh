#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-30 22:27
# * Filename : pull_code.sh
# **********************************************************
git fetch --all
git reset --hard github/master
git reset --hard gitee/master
git pull

