#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 23:14
# * Filename : 39cut_string.sh
# **********************************************************
Str="Learn Bash Commands from UbuntuPit"
#subStr=${Str:0:20}
subStr=$(echo $Str | cut -d ' ' -f 1-3)
echo $subStr

string1="Ubuntu"
string2="Pit"
string=$string1$string2
echo "$string is a great resource for Linux beginners."
