#!/bxn/bash
#by suliangliang on 2022-08-07
#Remark:for 循环是另一种广泛使用的 bash shell 结构，它允许用户有效地迭代代码.
for (( counter=1; counter<=10; counter++ ))
do
	echo -n "$counter " 
done 
printf "\n"  #在每次循环换行
