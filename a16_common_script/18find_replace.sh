#!/bin/bash
#======================================
# File name:shell_26find_replac1.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 19:35
#======================================
files=`find . -name "*.txt"`         #寻找txt类型的文件
for file in $files                   #遍历files
do
	read -p "请输入需要查找被替换的字符串:" str1
	read -p "请输入替换成什么字符串:" str2
	grep $str1 $file                     #将输入参数1与当前文件内容进行匹配
     	if [ $? == 0 ];then                 #判断是否匹配成功
		sed -i "s/$str1/$str2/g" $file  #在文件中将输入参数1替换为输入参数2
	elif [ $? != 0 ];then
	        echo -e "\033[31m 未查找到匹配的字符串 \033[0m"
		exit 0
        fi
done
