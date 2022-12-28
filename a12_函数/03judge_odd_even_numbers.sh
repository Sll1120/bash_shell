#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-19 17:13
# * Filename : 03iseven.sh
# **********************************************************
iseven () {
    if [ $(($1 % 2)) -eq 0 ]; then
        echo "$1 is even."
    else
        echo "$1 is odd."
    fi
}

iseven 3
iseven 4
iseven 20
iseven 111

