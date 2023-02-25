#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-18 15:08
# * Filename : 04awk_f.sh
# **********************************************************
#-f指定脚本文件
#awk -f {awk脚本} {文件名}
#BEGIN{
#FS=":"
#}
#{print $1}               #效果与awk -F":" '{print $1}'相同,只是分隔符使用FS在代码自身中指定
#awk 'BEGIN{X=0} /^$/{ X+=1 } END{print "I find",X,"blank lines."}' test 
#I find 4 blank lines.
 ls -l|awk 'BEGIN{sum=0} !/^d/{sum+=$5} END{print "total size is",sum}'          #计算文件大小
#total size is 17487
