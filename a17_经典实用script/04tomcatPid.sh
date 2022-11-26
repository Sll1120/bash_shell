#!/bin/bash
#======================================
# File name:echo_tomcat_pid.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 13:55
#======================================
v1="Hello"
v2="world"
v3=${v1}${v2}
echo $v3

pidlist=`ps -ef|grep apache-tomcat-7.0.75|grep -v "grep"|awk '{print $2}'`
echo $pidlist
echo "tomcat Id list :$pidlist"  //显示pid
