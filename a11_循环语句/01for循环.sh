#!/bin/bash
#======================================
# File name:shell_01for循环.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 00:07
#======================================
: '
与其他编程语言类似，Shell 支持 for 循环。
for 循环一般格式为：
for 变量 in 列表
do
command1
command2
...
commandN
done
列表是一组值（数字、字符串等）组成的序列，每个值通过空格分隔。每循环一次，就将列表中的下一个值赋给
变量。
in 列表是可选的，如果不用它，for 循环使用命令行的位置参数。
'
#例如，顺序输出当前列表中的数字：
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
#运行结果：
#The value is: 1
#The value is: 2
#The value is: 3
#The value is: 4
#The value is: 5
#顺序输出字符串中的字符：
for str in 'This is a string'
do
    echo $str
done
#运行结果：
#This is a string
#显示主目录下以 .bash 开头的文件：
#!/bin/bash
for FILE in $HOME/.bash*
do
    echo $FILE
done
#运行结果：
#/root/.bash_history
#/root/.bash_logout
#/root/.bashrc

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

echo '(4) -------------------------------------------------'
#类似C语言循环写法
#!/bin/bash

for (( counter=1; counter<=10; counter++ ))
do
echo -n "$counter "
done
printf "\n"
