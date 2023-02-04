#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-05 00:47
# * Filename : 06条件判断.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
1. 语法格式
格式1：==test== 条件表达式

格式2：[ 条件表达式 ]

格式3：[[ 条件表达式 ]]  支持正则 =~

说明：

man test去查看，很多的参数都用来进行条件判断

2. 条件判断相关参数
与文件存在与否的判断

-e    是否存在   不管是文件还是目录，只要存在，条件就成立
-f    是否为普通文件
-d    是否为目录
-S    socket
-p    pipe
-c    character
-b    block
-L    软link

三种语法格式：
test -e file                    只要文件存在条件为真
[ -d /shell01/dir1 ]            判断目录是否存在，存在条件为真
[ ! -d /shell01/dir1 ]        判断目录是否存在,不存在条件为真
[[ -f /shell01/1.sh ]]        判断文件是否存在，并且是一个普通的文件

-s 判断文件是否有内容（大小），非空文件条件满足
说明：-s表示非空，！ -s 表示空文件
说明：1.sh文件里有内容的。
[root@server shell01]# test -s 1.sh
[root@server shell01]# echo $?
0
[root@server shell01]# touch aaa
[root@server shell01]# cat aaa
[root@server shell01]# test -s aaa
[root@server shell01]# echo $?
1
[root@server shell01]# test ! -s aaa
[root@server shell01]# echo $?
0
[root@server shell01]# test ! -s 1.sh
[root@server shell01]# echo $?
1
文件权限相关的判断

-r    当前用户对其是否可读
-w    当前用户对其是否可写
-x    当前用户对其是否可执行
-u    是否有suid
-g    是否sgid
-k    是否有t位
两个文件的比较判断

file1 -nt  file2    比较file1是否比file2新    
file1 -ot  file2     比较file1是否比file2旧
file1 -ef  file2    比较是否为同一个文件，或者用于判断硬连接，是否指向同一个inode

test file1 -nt file2    
[ file1 -ot file2 ]
整数之间的判断

-eq    相等
-ne    不等
-gt    大于
-lt    小于
-ge   大于等于
-le    小于等于
字符串之间的判断

-z  是否为空字符串           字符串长度为0，就成立
-n  是否为非空字符串        只要字符串非空，就是成立
string1 = string2         是否相等
string1 != string2         不等

[root@server shell01]# AAA=hello
[root@server shell01]# BBB=world
[root@server shell01]# test -z $AAA
[root@server shell01]# echo $?
1
[root@server shell01]# test -n $AAA
[root@server shell01]# echo $?
0

[root@server shell01]# [ $AAA = $BBB ]
[root@server shell01]# echo $?
1
[root@server shell01]# [ $AAA != $BBB ]
[root@server shell01]# echo $?
0
多重条件判断

逻辑判断符号：
 -a     和 &&      (and 逻辑与)       两个条件同时满足，整个大条件为真
 -o     和 ||    (or 逻辑或)            两个条件满足任意一个，整个大条件为真


[ 1 -eq 1 -a 1 -ne 0 ]                整个表达式为真
[ 1 -eq 1 ] && [ 1 -ne 0 ]            


[ 1 -eq 1 -o 1 -ne 1 ]                整个表达式为真
[ 1 -eq 1 ] || [ 1 -ne 1 ]

[root@server shell01]# [ 1 -eq 0 ] && echo true || echo false
false
[root@server shell01]# [ 1 -eq 1 ] && echo true || echo false
true

&&:前面的表达式为真
||：前面的表达式为假



总结：
1、; && ||都可以用来分割命令或者表达式
2、; 完全不考虑前面的语句是否正确执行，都会执行;号后面的内容
3、&& 需要考虑&&前面的语句的正确性，前面语句正确执行才会执行&&后的内容；反之亦然
make && make install
4、|| 需要考虑||前面的语句的非正确性，前面语句执行错误才会执行||后的内容；反之亦然
5、如果&&和||一起出现，从左往右依次看，按照以上原则
3. 示例
示例：
数值比较：
[root@server ~]# [ $(id -u) -eq 0 ] && echo "the user is admin"
[root@server ~]$ [ $(id -u) -ne 0 ] && echo "the user is not admin"
[root@server ~]$ [ $(id -u) -eq 0 ] && echo "the user is admin" || echo "the user is not admin"

[root@server ~]# uid=`id -u`
[root@server ~]# test $uid -eq 0 && echo this is admin
this is admin
[root@server ~]# [ $(id -u) -ne 0 ]  || echo this is admin
this is admin
[root@server ~]# [ $(id -u) -eq 0 ]  && echo this is admin || echo this is not admin
this is admin
[root@server ~]# su - stu1
[stu1@server ~]$ [ $(id -u) -eq 0 ]  && echo this is admin || echo this is not admin
this is not admin
[stu1@server ~]$ 


类C风格的数值比较：
注意：在(( ))中，=表示赋值；==表示判断
 1159  ((1==2));echo $?
 1160  ((1<2));echo $?
 1161  ((2>=1));echo $?
 1162  ((2!=1));echo $?
 1163  ((`id -u`==0));echo $?

 1209  ((a=123));echo $a
 1210  unset a
 1211  ((a==123));echo $?



字符串比较：
注意：双引号引起来，看作一个整体；= 和 == 在 [ 字符串 ] 比较中都表示判断
 1196  a='hello world';b=world
 1197  [ $a = $b ];echo $?
 1198  [ "$a" = "$b" ];echo $?
 1199  [ "$a" != "$b" ];echo $?
 1200  [ "$a" !== "$b" ];echo $?        错误
 1201  [ "$a" == "$b" ];echo $?
 1202  test "$a" != "$b";echo $?

思考：[ ] 和 [[ ]] 有什么区别？
 1213  a=
 1214  test -z $a;echo $?
 1215  a=hello
 1216  test -z $a;echo $?
 1217  test -n $a;echo $?
 1217  test -n "$a";echo $?

# [ '' = $a ];echo $?
-bash: [: : unary operator expected
2
# [[ '' = $a ]];echo $?
0


 1278  [ 1 -eq 0 -a 1 -ne 0 ];echo $?
 1279  [ 1 -eq 0 && 1 -ne 0 ];echo $?
 1280  [[ 1 -eq 0 && 1 -ne 0 ]];echo $?

