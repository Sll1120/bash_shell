#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-07 17:33
# * Filename : 19batch_.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
read -p "请输入需要被替换的字符串" i  
read -p "请输入替换后的字符串" j
sed -i "s/i/j/g" `grep "i" -rl ./*/CAL/`
sed -i "s/06/11/g" `grep -n "^?WI" */CAL/*.csv | grep "06" -rl */CAL/*.csv`

echo '(2)-----------------------完美分割线--------------------------------'
#sed -i "s/1.4.20/2.4.30/g" `grep "1.4.20" -rl */BDP/*.csv`
#sed -i "s/11.14/12.15/g" `grep "11.14" -rl */BDP/*.csv`
#sed -i "s/8/12/g" `grep -n "^?WY" */BDP/*.csv | grep "8" -rl */BDP/*.csv`
