#!/bin/bash

#kill tomcat pid

pidlist=`ps -ef|grep apache-tomcat-7.0.75|grep -v "grep"|awk '{print $2}'`  #找到tomcat的PID号

echo "tomcat Id list :$pidlist"  //显示pid

kill -9 $pidlist  #杀掉改进程

echo "KILL $pidlist:" //提示进程以及被杀掉

echo "service stop success"

echo "start tomcat"

cd /opt/apache-tomcat-7.0.75

pwd 

rm -rf work/*

cd bin

./startup.sh #;tail -f ../logs/catalina.out
