#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-19 10:48
# * Filename : 08awk_条件表达式.sh
# **********************************************************
# 条件表达式
# ==   !=   >   >= 
awk -F":" '$1=="sll"{print $3}' /etc/passwd 
awk -F":" '{if($1=="sll") print $3}' /etc/passwd          #与上面相同
awk -F":" '$1!="sll"{print $3}' /etc/passwd                 #不等于
awk -F":" '$3>1000{print $3}' /etc/passwd                      #大于
awk -F":" '$3>=100{print $3}' /etc/passwd                     #大于等于
awk -F":" '$3<1{print $3}' /etc/passwd                            #小于
awk -F":" '$3<=1{print $3}' /etc/passwd                         #小于等于
