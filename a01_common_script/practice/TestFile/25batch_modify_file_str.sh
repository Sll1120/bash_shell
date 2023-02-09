#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-07 17:33
# * Filename : 19batch_.sh
# **********************************************************
# CAL修改如下:
read -p '请输入你第一个需要被替换的字符串：' str1
read -p '请输入你第一个需要替换后的字符串：' str11
sed -i "s/$str1/$str11/g" `grep "$str1" -rl */CAL/*.csv`
#read -p '请输入你第二个需要被替换的字符串：' str2
#read -p '请输入你第二个需要替换后的字符串：' str22
#sed -i "s/$str2/$str22/g" `grep "$str2" -rl ./*/CAL/*.csv`

# BDP修改如下:
#sed -i "s/1.4.20/2.4.30/g" `grep "1.4.20" -rl */BDP/*.csv`
#sed -i "s/11.14/12.15/g" `grep "11.14" -rl */BDP/*.csv`
#sed -i "s/8/12/g" `grep -n "^?WY" */BDP/*.csv | grep "8" -rl */BDP/*.csv`
