#!/bin/bash
#======================================
# File name:shell_27while_loop.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 20:05
#======================================
#!/bin/bash
s=0
i=1
while [ $i -le 100 ]
do
    s=$[$s + $i]
     i=$[$i + 1]
done
echo $s
echo $i
