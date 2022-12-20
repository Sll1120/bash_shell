#!/bin/bash
#======================================
# File name:sed.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-23 10:16
#======================================
: '
Linux的sed命令详解大全
一、sed命令介绍
二、sed 的运行模式
三、sed的相关选项
四、sed基本用法
    1.sed语法
    2.sed的查看功能
          查看passwd文件的第5到第8行内容
          查看passwd文件中以roo开头的行
          忽略大小写，对含有root字符的行打印出来
    3.sed的查找功能
    4.将 /data/passwd 第 2~5 行删除打印输出
    5.以行为单位的新增
          1,在文件passwd上的第四行后面添加新字符串
          2,passwd第1前追加huawei
    6.sed替换功能
         1,passwd第三行替换为redhat
    7.sed的查找及替换功能
    8.sed对原文件操作
         1,删除原文件第1行
        2,修改原文件之前备份
一、sed命令介绍
sed全称是：Stream EDitor（流编辑器）
Linux sed 命令是利用脚本来处理文本文件，sed 可依照脚本的指令来处理、编辑文本文件。Sed 主要用来自动编辑一个或多个文件、简化对文件的反复操作、编写转换程序等。

二、sed 的运行模式
当处理数据时，Sed 从输入源一次读入一行，并将它保存到所谓的模式空间pattern space中。所有 Sed 的变换都发生在模式空间。变换都是由命令行上或外部 Sed 脚本文件提供的单字母命令来描述的。大多数 Sed 命令都可以由一个地址或一个地址范围作为前导来限制它们的作用范围。

三、sed的相关选项
 -n, --quiet, --silent    取消自动打印模式空间
 -e 脚本, --expression=脚本   添加“脚本”到程序的运行列表
 -f 脚本文件, --file=脚本文件  添加“脚本文件”到程序的运行列表
 --follow-symlinks    直接修改文件时跟随软链接
 -i[扩展名], --in-place[=扩展名]    直接修改文件(如果指定扩展名就备份文件)
 -l N, --line-length=N   指定“l”命令的换行期望长度
 --posix  关闭所有 GNU 扩展
 -r, --regexp-extended  在脚本中使用扩展正则表达式
 -s, --separate  将输入文件视为各个独立的文件而不是一个长的连续输入
 -u, --unbuffered  从输入文件读取最少的数据，更频繁的刷新输出
 --help     打印帮助并退出
 --version  输出版本信息并退出
 -a ∶新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
 -c ∶取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
 -d ∶删除，因为是删除啊，所以 d 后面通常不接任何咚咚；
 -i ∶插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
 -p ∶列印，亦即将某个选择的资料印出。通常 p 会与参数 sed -n 一起运作～
 -s ∶取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正规表示法
'
#四、sed基本用法
#1.sed语法
#Usage: sed [OPTION]... {script-only-if-no-other-script} [input-file]...

#2.sed的查看功能
#1,查看passwd文件的第5到第8行内容
echo '(1)----------------------完美分割线-------------------------------'
sed -n '5,8 p' /etc/passwd

#2,查看/etc/passwd文件中以roo开头的行
echo '(2)----------------------完美分割线-------------------------------'
sed -n '/^roo/ p' /etc/passwd

#3,忽略大小写，对含有root字符的行打印出来
echo '(3)----------------------完美分割线-------------------------------'
sed -n '/root/I p' /etc/passwd

#3.sed的查找功能
#查找/etc/passwd文件中有/bin/bash字符串的行
echo '(4)----------------------完美分割线-------------------------------'
sed -n '\%/bin/bash% p' /etc/passwd

#4.将 /data//etc/passwd 第 2~5 行删除打印输出
echo '(5)----------------------完美分割线-------------------------------'
sed '2,5 d' /etc/passwd |head

#5.以行为单位的新增
#1,在文件/etc/passwd上的第四行后面添加新字符串
echo '(6)----------------------完美分割线-------------------------------'
sed -e 4a\it-test /etc/passwd | head

#,/etc/passwd第1前追加huawei
echo '(7)----------------------完美分割线-------------------------------'
sed '1 i\huawei ' /etc/passwd |head

#6.sed替换功能
#1,/etc/passwd第三行替换为redhat
echo '(8)----------------------完美分割线-------------------------------'
sed '3 c\redhat' /etc/passwd
sed '3 c\redhat' /etc/passwd |head

#7.sed的查找及替换功能
#将/etc/passwd的5到10的bin字符串查找出来替换为aaaa
echo '(9)----------------------完美分割线-------------------------------'
sed -n '5,10 s/bin/aaaa/ p' /etc/passwd |head

#8.sed对原文件操作
#1,删除原文件第1行
#sed -i '1 d' /etc/passwd
#2,修改原文件之前备份
#sed -i.bak '1 d' /etc/passwd
