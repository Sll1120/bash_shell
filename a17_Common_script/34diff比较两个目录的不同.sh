#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-25 10:46
# * Filename : diff_tree_files.sh
# **********************************************************
#Linux下快速比较两个目录的不同
#玩linux编程，文件对比还是经常用的；
#方法一：使用diff
#使用diff结合tree
#[sll@1120:~/bash_script]$ diff <(tree -Ci --noreport 11) <(tree -Ci --noreport 22)
#1,2c1,2
#< 11
#< guess.sh
#---
#> 22
#> judge_exist2.sh
#说明：
#tree的-C选项是输出颜色，如果只是看一下目录的不同，可以使用该选项，但在结合其他命令使用的时候建议不要使用该选项，因为颜色也会转换为对应的编码而输出；
#-i是不缩进，建议不要省略-i，否则diff的结果很难看，也不好继续后续的文件操作；
#--noreport是不输出报告结果，建议不要省略该选项。
#该方法效率很高。
if [ $# -ne 2 ] 
then
	echo -e "\033[31m Wrong ! please input 2 folder name !\033[0m"
	exit 1
fi
diff <(tree -Ci --noreport $1) <(tree -Ci --noreport $2)

#方法二：find结合diff
#[sll@1120:~/bash_script]$ find 11 -printf "%Pn" | sort > file1
#[sll@1120:~/bash_script]$ find 22 -printf "%Pn" | sort | diff file1 -
#1c1
#< nguess.shnprint_time.shn
#---
#> nprint_time.shnjudge_exist2.shn
#说明：
#<代表的行是11中有而22没有的文件，>则相反，是22中有而11中没有。
#不要省略-printf "%Pn"，此处的%P表示find的结果中去掉前缀路径，详细内容man find。例如，find /root/ -printf "%Pn"的结果中将显示/root/a/xyz.txt中去掉/root/后的结果：a/xyz.txt。
#效率很高，输出也简洁。

#2.图形化的比较结果
#方法一：使用vimdiff
#vimdiff <(cd 11; find . | sort) <(cd 22; find . | sort)
#
#方法二：使用meld
#meld是python写的一个图形化文件/目录比较工具，所以必须先安装图形界面或设置好图形界面接受协议。它的功能非常丰富，和win下的beyond compare有异曲同工之妙。
#meld具体的使用方式就不介绍了。
#
#3.将两目录中不同的文件筛选出来
#个人建议使用命令行输出的结果中的方法方法三和方法四，因为它们都能很好地保留目录前缀。
#以方法三为例：
#find directory1 -printf "%Pn" | sort > file1
#find directory2 -printf "%Pn" | sort | diff file1 -
#以下是实验所需目录结构：
#[root@node1 ~]# tree /root/a;tree /root/b 
#/root/a
#├── 1.png
#├── 2.png
#└── 3.png
#
#0 directories, 3 files
#/root/b
#├── 2.png
#├── 3.png
#├── 4.png
#└── xen
#    └── scripts
#        └── block-drbd
#首先比较这两个目录得到文件列表的差异。
#
#find /root/a -printf "%Pn" | sort > /tmp/file1
#find /root/b -printf "%Pn" | sort | diff /tmp/file1 - >diff.txt
#然后从diff.txt中过滤出/root/a中多出的文件和/root/b中多出的文件。
#
## /root/a中多出的文件
#awk '/</{printf("%s%sn","/tmp/etc/",$2)}' diff.txt
#/tmp/etc/1.png
#
## /root/b中多出的文件
#awk '/>/{printf("%s%sn","/tmp/etc/",$2)}' diff.txt
#/tmp/etc/4.png
#/tmp/etc/xen
#/tmp/etc/xen/scripts
#/tmp/etc/xen/scripts/block-drbd
#需要注意的是，如果多了某个目录，则这个目录和其内所有文件都会列出来。如果要将多出的文件复制到其他地方，应当要注意这一点。
#
#如果只想要比较出/root/a和/root/b下的文件和目录的不同，不再递归到子目录中比较。那么可以在find上继续加工一番：
#
#find /root/a -maxdepth 1 -printf "%Pn" | sort > /tmp/file1
#find /root/b -maxdepth 1 -printf "%Pn" | sort | diff /tmp/file1 - >diff.txt
## /root/a中多出的文件
#awk '/</{printf("%s%sn","/tmp/etc/",$2)}' diff.txt
#/tmp/etc/1.png
#
## /root/b中多出的文件
#awk '/>/{printf("%s%sn","/tmp/etc/",$2)}' diff.txt
#/tmp/etc/4.png
#/tmp/etc/xen
#这样一来，/root/b中多出的文件就是4.png和xen，xen目录中的文件不再列出。
