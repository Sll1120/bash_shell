#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-19 18:57
# * Filename : 07awk_if语句.sh
# **********************************************************
echo '----------------完美分割线------------------------------------------------------------'
#IF语句
#必须用在{}中，且比较内容用()扩起来
awk -F: '{if($1~/mail/) print $1}' /etc/passwd                              #简写
awk -F: '{if($1~/mail/) {print $1}}'  /etc/passwd                           #全写
awk -F: '{if($1~/mail/) {print $1} else {print $2}}' /etc/passwd            #if...else...
awk -F: '{if($3>100) print "large"; else print "small"}' /etc/passwd
awk -F: 'BEGIN{A=0;B=0} {if($3>100) {A++; print "large"} else {B++; print "small"}} END{print A,"\t",B}' /etc/passwd 		#ID大于100,A加1，否则B加1
awk -F: '{if($3<100) next; else print}' /etc/passwd                         #小于100跳过，否则显示
#awk -F: 'BEGIN{i=1} {if(i<nf) print="" nr,nf,i++="" }'="" etc="" passwd=""   <="" span="">
#awk -F: 'BEGIN{i=1} {if(i<nf) {print="" nr,nf}="" i++="" }'="" etc="" passwd<="" span="">
#另一种形式
awk -F: '{print ($3>100 ? "yes":"no")}'  /etc/passwd
awk -F: '{print ($3>100 ? $3":\tyes":$3":\tno")}'  /etc/passwd
