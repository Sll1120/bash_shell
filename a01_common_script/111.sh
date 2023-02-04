#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-04 11:33
# * Filename : 111.sh
# **********************************************************
files=$(find . -name "*.sh") #寻找txt类型的文件
for file in $files; do        #遍历files
	read -p "请输入需要查找被替换的字符串:" str1
	grep $str1 $file                #将输入参数1与当前文件内容进行匹配
	if [ $? == 0 ]; then            #判断是否匹配成
		echo -e "\033[32m 查找到匹配的字符串 \033[0m"
	elif [ $? != 0 ]; then
		echo -e "\033[31m 未查找到匹配的字符串 \033[0m"
		exit 0
	fi
done


