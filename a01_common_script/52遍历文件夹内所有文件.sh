#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 16:38
# * Filename : 52遍历文件夹内所有文件.sh
# **********************************************************
#详解shell 遍历文件夹内所有文件并打印绝对路径
#例如你有一个文件夹路径是 files，如果想要遍历这个文件夹内的所有文件，
#并将它们保存到数组中，利用shell你可以这样做
echo '(1)-----------------------完美分割线--------------------------------'
for file in files/*; do
	if test -f $file; then
		arr=(${arr[*]} $file)
	fi
done
echo ${arr[@]}
#这样就可以遍历files文件夹下的所有文件并把它们的绝对路径存在arr这个数组中，但这还是不够的，因为文件夹中可能会有多个子文件夹，如果只过滤文件会遗漏掉子文件夹中的文件，所以需要扩展上面的方法，如果我们只考虑两级目录的话可以这样写
echo '(2)-----------------------完美分割线--------------------------------'
for file in files/*; do
	if test -f $file; then
		arr=(${arr[*]} $file)
	else
		for subfile in $file; do
			if test -f $subfile; then
				arr=(${arr[*]} $subfile)
			fi
		done
	fi
done
echo ${arr[@]}
echo '(3)-----------------------完美分割线--------------------------------'
#这样就可以把目标文件夹下的两级目录内所有文件的绝对路径获取到，那么如果有多级子目录的情况呢，这就要求我们去写一个function来协助我们
#function getdir(){
#    echo $1
#    for file in $1/*
#    do
#    if test -f $file
#    then
#        echo $file
#        arr=(${arr[*]} $file)
#    else
#        getdir $file
#    fi
#    done
#}
#getdir files
#echo ${arr[@]}

