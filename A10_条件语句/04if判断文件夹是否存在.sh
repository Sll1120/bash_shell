#!/bin/bash
#by suliangliang on 2022-08-07
#Remark:
DIR=/temp/snap.snapd-desktop-integration
FILES=/temp/install.sh
if [ ! -d $DIR ] #判目录是否存在
then
	mkdir -p $DIR
	echo -e "\033[33mthis $DIR create success!\033[0m"
	ls $DIR
else
	echo -e "\033[32mthis $DIR is exist . please exit!\033[0m"
fi
if [ ! -f $FILES ] #2判断文件是否存在
then
	touch $FILES
	echo -e "\033[33mthis $FILES create success!\033[0m"
	cat $FILES
else
	echo -e "\033[32mthis $FILES is exist .pleas exit!\033[0m"
fi
