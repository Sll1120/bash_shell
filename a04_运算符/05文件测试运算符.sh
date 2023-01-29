#!/bin/bash
#======================================
# File name:shell_05文件测试运算符.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 11:51
#======================================
#文件测试运算符
#文件测试运算符用于检测 Unix 文件的各种属性。
#例如，变量 file 表示文件“/var/www/tutorialspoint/unix/test.sh”，
#它的大小为100字节，具有 rwx 权限。下面的代码，将检测该文件的各种属性：
#!/bin/sh
file="/home/sll/github/shell/shell_04运算符/name.txt"
if [ -r $file ]
then
    echo "File has read access"
else
    echo "File does not have read access"
fi
if [ -w $file ]
then
    echo "File has write permission"
else
    echo "File does not have write permission"
fi
if [ -x $file ]
then
    echo "File has execute permission"
else
    echo "File does not have execute permission"
fi
if [ -f $file ]
then
    echo "File is an ordinary file"
else
    echo "This is sepcial file"
fi
if [ -d $file ]
then
    echo "File is a directory"
else
    echo "This is not a directory"
fi
if [ -s $file ]
then
    echo "File size is not zero"
else
    echo "File size is zero"
fi
if [ -e $file ]
then
    echo "File exists"
else
    echo "File does not exist"
fi
#运行结果：
#File has read access
#File has write permission
#File has execute permission
#File is an ordinary file
#This is not a directory
#File size is not zero
#File exists
: '
文件测试运算符列表
操作符      说明                                             举例
-b file     检测文件是否是块设备文件，如果是，则返回 true。  [ -b $file ]返回 false
-c file     检测文件是否是字符设备文件，如果是，则返回 true。[ -b $file ]返回false
-d file     检测文件是否是目录，如果是，则返回 true。        [ -d $file ]返回 false
-f file     检测文件是否是普通文件（既不是目录，也不是设备文件），如果是则返回 true
                                                                 [ -f $file ] 返回true   
-g file     检测文件是否设置了 SGID 位，如果是，则返回 true。[ -g $file ] 返回false
-k file     检测文件是否设置了粘着位(Sticky Bit)如果是，则返回true [ -k $file ]返回false
-p file     检测文件是否是具名管道，如果是，则返回 true。[ -p $file ] 返回false
-u file     检测文件是否设置了 SUID 位，如果是，则返回 true。[ -u $file ] 返回false
-r file     检测文件是否可读，如果是，则返回 true。[ -r $file ] 返回true
-w file     检测文件是否可写，如果是，则返回 true。[ -w $file ] 返回true
-x file     检测文件是否可执行，如果是，则返回 true。[ -x $file ] 返回true
-s file     检测文件是否为空(文件大小是否大于0)不为空返回true [ -s $file ]返回true
-e file     检测文件（包括目录）是否存在，如果是，则返回 true。[ -e $file ] 返回true
'
