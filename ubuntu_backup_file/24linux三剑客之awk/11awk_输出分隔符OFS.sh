#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-19 18:10
# * Filename : 11awk_输出分隔符OFS.sh
# **********************************************************
awk '$2 ~ /Are/ || NR==1 {print NR,$2,$3,$4}' OFS="\t" test.txt       
#输出字段2匹配there的行，其中输出每行行号，字段2,3,4，并使用制表符分割字段

