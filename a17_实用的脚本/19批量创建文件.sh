#!/bin/bash
#======================================
# File name:create_files.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 10:59
#======================================
#创建文件

#!/bin/bash
for file in `cat name.txt | awk '{print $1}'`
do
    touch ${file}.sh
done
