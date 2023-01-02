#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 12:26
# * Filename : batch_create_files.sh
# **********************************************************
#!/bin/bash
for file in `cat z_example_1.txt | awk '{print $1}'`
do
    touch ${file}.sh
done
