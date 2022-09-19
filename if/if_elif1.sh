#!/bin/bash
#by suliangliang on 2022-08-07
#Remark:多分支IF条件语句
: '
if [ 条件判断式1 ]
  then
    当条件判断式1成立时，执行程序1
elif [ 条件判断式2 ]
  then
    当条件判断式2成立时，执行程序2

...省略更多条件...
else
  当所有条件都不成立的时候，最后执行此程序
fi
'
echo -n "Enter a number:" 
read num
if [[ $num -gt 10 ]]
then
	echo "Number is greater than 10."
elif [[ $num -eq 10 ]]
then
	echo "Number is equal to 10."
else
	echo "Number is less than 10."
fi
