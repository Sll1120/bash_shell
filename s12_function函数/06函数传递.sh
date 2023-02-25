#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 17:06
# * Filename : 06.sh
# **********************************************************
#允许数据从一个函数传递到另一个函数。它在各种场景中都很有用。
#这里，输出包含从 Greet() 函数接收到的数据。

Greet() {
str="Hello $name, what brings you to UbuntuPit.com?"
echo $str
}
echo "-> what's your name?"
read name
val=$(Greet)
echo -e "-> $val"
