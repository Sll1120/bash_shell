#!/bin/bash
echo "entr number:"
read n
if [[ $n -lt 10 ]]
then
	echo "It is a 1 digit number"
elif [[ $n -ge 10 && $n -lt 100 ]];then
	echo "It is a 2 digit number"
elif [ $n -ge 100 ] && [ $n -lt 1000 ];then
	echo "It is a 3 digit number"
elif [ $n -ge 1000 ] && [ $n -lt 10000 ]
then
	echo "It is a 4 digit number"
else
	echo -e "This is a number with more than 5 digits"
fi
