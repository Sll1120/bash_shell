#!/bin/bash
#filename1=/mnt/res/vapp/appd.conf
#filename2=/mnt/res/vapp/AC.conf
filename1=./appd.conf
filename2=./AC.conf
#判断appd.conf是否存在
if [ -f  $filename1 ];
then
    echo -e "\033[32mappd.conf file exists\033[0m"
    echo -e "文件信息如下:\n--------------------"
    cat $filename1
    echo -e "\n--------------------\n"
else
    echo -e "\033[31mappd.conf file does not exist\033[0m"
fi
#判断AC.conf是否存在
if [ -f $filename2 ]; 
then
    echo -e "\033[32mAC.conf file exists\033[0m"
    echo -e "文件信息如下:\n--------------------"
    cat $filename2
    echo -e "\n--------------------\n"
else
    echo -e "\033[31mAC.conf file does not exist\033[0m"
fi
