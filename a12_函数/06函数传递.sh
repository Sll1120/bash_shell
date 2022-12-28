#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 17:06
# * Filename : 06.sh
# **********************************************************
Greet() {
str="Hello $name, what brings you to UbuntuPit.com?"
echo $str
}
echo "-> what's your name?"
read name
val=$(Greet)
echo -e "-> $val"
