#!/bin/bash
#filename1=/mnt/res/vapp/appd.conf
#filename2=/mnt/res/vapp/AC.conf
filename1=./appd.conf
filename2=./AC.conf
#判断appd.conf是否存在
if [ -f  $filename1 ];
then
    echo -e "\e[32mappd.conf file exists\e[0m"
    echo -e "文件信息如下:\n--------------------"
    cat $filename1
    echo -e "\n--------------------\n"
else
    echo -e "\e[31mappd.conf file does not exist\e[0m"
fi
#判断AC.conf是否存在
if [ -f $filename2 ]; 
then
    echo -e "\e[32mAC.conf file exists\e[0m"
    echo -e "文件信息如下:\n--------------------"
    cat $filename2
    echo -e "\n--------------------\n"
else
    fcho -e "\e[31mAC.conf file does not exist\e[0m"
fi
