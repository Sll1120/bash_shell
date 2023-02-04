#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-22 10:05
# * Filename : change_string.sh
# **********************************************************
sed -i "s/1.0.80/1.0.81/g" `grep "1.0.80" -rl ./*/CAL/`
sed -i "s/06/11/g" `grep -n "^?WI" */CAL/*.csv | grep "06" -rl */CAL/*.csv`

#sed -i "s/1.4.20/2.4.30/g" `grep "1.4.20" -rl */BDP/*.csv`
#sed -i "s/11.14/12.15/g" `grep "11.14" -rl */BDP/*.csv`
#sed -i "s/8/12/g" `grep -n "^?WY" */BDP/*.csv | grep "8" -rl */BDP/*.csv`
