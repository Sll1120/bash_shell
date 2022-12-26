#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-22 10:05
# * Filename : change_string.sh
# **********************************************************
sed -i "s/2.4.50/2.5.06/g" `grep "2.4.50" -rl ./*/CAL/`
sed -i "s/1.0.73/1.0.80/g" `grep "1.0.73" -rl ./*/CAL/`
