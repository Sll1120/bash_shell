#!/bin/bash
#======================================
# File name:shell_02for循环.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 00:14
#======================================
echo '(1) -------------------------------------------------'
#!/bin/bash
sum=0 
read -p '请输入一个1-100之间的整数：' a
for ((i=1;i<=$a;i++))
do
    sum=$[$sum + $i]
done
echo "$sum"
#printf "\n"  #在每次循环换行

echo '(2) -------------------------------------------------'
#!/bin/bash
n=0
for i in {1..100}
do 
	n=`expr $i + $n`
done
echo $n

echo '(3) -------------------------------------------------'
#!/bin/bash
k=0
l=1
while ((l<=100))
do
	k=`expr $k + $l` 
	((l++))
done
echo $k
