#!/bin/bash
FILES="./file.txt" 
DIR="./directory"
#文件的判断
if [ -f $FILES ]
then
    echo "$FILES is regular file!"
elif [ -d $FILES ]
then
    echo "$FILES is directory!"
else
    echo "$FILES is not regular file and directory"
fi
#目录的判断
if [ -f $DIR ]
then
    echo "$DIR is regular file!"
elif [ -d $DIR ]
then
    echo "$DIR is directory!"
else
    echo "$DIR is not regular file and directory"
fi
