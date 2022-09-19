#!/bin/bash
#for 循环是另一种广泛使用的 bash shell 结构，它允许用户有效地迭代代码
#计算任意几个数之和
sum=0
for (( counter=1; counter<5; counter++ ))
do
echo -n "Enter Your Number:"
read n
(( sum+=n ))
#echo -n "$counter "
done
printf "\n"
echo "Result is: $sum"
