#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-09 19:14
# * Filename : push_gitee.sh
# **********************************************************
git add .
git commit -m "Released in `date "+%Y-%m-%d %H:%M"`"
echo -e "\033[32m start push code to gitee.\033[0m"
sleep 1

#git push gitee master
git push -u gitee +master
if [ $? = 0 ];then
	echo -e "\e[1;32m gitee 服务器推送 success ! \e[0m"
else
	echo -e "\e[1;31m gitee 服务器推送 fail ! \e[0m"
fi

echo -e "-------------------------------------------------"
#git push github master
git push -u github +master
if [ $? = 0 ];then
	echo -e "\033[1;32m github 服务器推送 success ! \033[0m"
else
	echo -e "\033[1;31m github 服务器推送 fail ! \033[0m"
fi
