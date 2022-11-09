#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-07 18:15
# * Filename : 1.sh
# **********************************************************
#for file in files/*
#do
#    if test -f $file
#    then
#        arr=(${arr[*]} $file)
#    else
#        for subfile in $file
#            do
#                if test -f $subfile
#                then
#                    arr=(${arr[*]} $subfile)
#                fi
#            done
#    fi
#done
#echo ${arr[@]}

function getdir(){
    echo $1
    for file in $1/*
    do
    if test -f $file
    then
        echo $file
        arr=(${arr[*]} $file)
    else
        getdir $file
    fi
    done
}
getdir /files
echo ${arr[@]}
