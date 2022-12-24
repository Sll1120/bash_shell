#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-10 11:26
# * Filename : batch_replacement.sh
# **********************************************************
sed -n '37 s/T3/30/' `grep -REnl "T3" testFile/`
