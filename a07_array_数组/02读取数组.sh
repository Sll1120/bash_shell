#!/bin/bash
#======================================
# File name:shell_02读取数组.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 12:29
#======================================
: '
读取数组
读取数组元素值的一般格式是：
${array_name[index]}
例如：
valuen=${array_name[2]}
'
#举个例子：
#!/bin/sh
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"
#运行脚本，输出：
#$./test.sh
#First Index: Zara
#Second Index: Qadir
#使用@或*可以获取数组中的所有元素，例如：
${array_name[*]}
${array_name[@]}
#举个例子：
#!/bin/sh
NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Method: ${NAME[*]}"
echo '-----------------------------------------------------------'
echo "Second Method: ${NAME[@]}"
#运行脚本，输出：
#$./test.sh
#First Method: Zara Qadir Mahnaz Ayan Daisy
#Second Method: Zara Qadir Mahnaz Ayan Daisy
