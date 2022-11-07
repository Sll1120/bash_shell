#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-24 14:21
# * Filename : Linux三剑客命令实战案例01.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
#Grep实例介绍
grep "San" testfile.txt
#过滤有San的行
grep '^J' testfile.txt
#显示以J开头的行
grep '70$' testfile.txt
#显示以70结尾的行
grep -v "834" testfile.txt
#显示所有不包括834的行
grep ':12/' testfile.txt
#显示:12/的行
grep ':498-' testfile.txt
#显示:498-的行
grep '[A-Z][a-z]{4}:[[:space:]][A-Z]' testfile.txt
#显示这样的行，一个大写字母+四个小写字母+空格+一个大写字母
grep '[a-z]{1,}[[:space:]][Kk]' testfile.txt
#显示包括K k的行
grep -n '[0-9]{6,}$' testfile.txt
#显示6位数字的行，并打印行号
grep -i "lincoln" testfile.txt
#显示有lincoln的行，不区分大小写

echo '(2)-----------------------完美分割线--------------------------------'
#Sed实例介绍
sed 's/Jon/Jonathan/g' testfile.txt
#全局替换（Jon替换成Jonathan）
sed '1,3d' testfile.txt
#删除文件1-3行
sed -n '5,10p' testfile.txt
#打印文件5-10行内容
sed '/Lane/d' testfile.txt
#删除包包含lane的行
sed -ne '/[1-9]{5}:1[12]/p' testfile.txt
#打印由5个数字+:11/12的行
sed 's/^Fred/***&/' testfile.txt
#在以Fred开头的行前加上***
sed -e 's/.*Jose.*/JOSE HAS RETIRE/g' testfile.txt
#将包含Jose的行替换成JOSE HAS RETIRE
#sed -n '/^Popeye/p' testfile.txt |sed 's/[0-9]{1,}/[0-9]{1,}/[0-9]{1,}/11/14/46/g'
#将以Popeye开头的行打印，然后将“数字/数字/数字”这格式的数字串替换成 11/14/46
##pattern{n} 匹配模式出现n次。
#pattern{n,} 匹配模式出现最少n次。
#pattern{n,m} 匹配模式出现n到m次之间，n , m为0 - 2 5 5中任意整数
sed '/^$/d' testfile.txt
#删除所有空行
sed 's/.$//g' testfile.txt
#删除以.结尾行
sed 's/^[][]*//g' testfile.txt
#删除行首空格
sed 's//.[][]*/[]/g' testfile.txt
#删除句号后跟两个或更多的空格,用一个空格代替
sed 's/^.//g' testfile.txt
#删除第一个字符
sed 's/COL/(.../)//g' testfile.txt
#删除紧跟COL的后三个字符
sed 's/^g' testfile.txt
#删除路径中第一个/
sed -n '3,/245700/'p testfile.txt
#从第三行开始查询到245700结束并打印
sed -n '2,26!'p testfile.txt
#打印文件（除2-26）的行

echo '(3)-----------------------完美分割线--------------------------------'
#Awk实例介绍
awk –F : '{print $2}' testfile.txt
#以:分隔打印第二列
awk –F : '/^Dan/{print $2}' testfile.txt
#以:分隔打印以Dan开头行的第二列内容
awk –F : '/^[CE]/{print $1}' testfile.txt
#打印以C或E开头行的第一列
awk –F : '{if(length($1) == 4) print $1}' testfile.txt
#打印以:分隔且长度为4字符的第一列内容
awk –F : '/[916]/{print $1}' testfile.txt
#匹配916的行以:分隔打印第一列
awk -F : '/^Vinh/{print "a"$5}' testfile.txt
#显示以Dan开头行并在第五列前加上a
awk –F : '{print $2”,”$1}'  testfile.txt
#打印第二列第一列并以,分隔
awk -F : '($5 == 68900) {print $1}' testfile.txt
#以:分隔打印第五列是68900的行第一列
echo '(4)-----------------------完美分割线--------------------------------'
awk -F : '{if(length($1) == 11) print $1}' testfile.txt
#打印以:分隔且长度为4字符的第一列内容
echo '(5)-----------------------完美分割线--------------------------------'
awk -F : '$1~/Tommy Savage/ {print $5}' testfile.txt
echo '(5-1)-----------------------完美分割线--------------------------------'
awk -F : '($1 == "Tommy Savage") {print $5}' testfile.txt
#打印以:分隔且第一列为Tommy Savage的第五列内容
echo '(6)-----------------------完美分割线--------------------------------'
ls -l | awk  '{sum+=$5}  END{print sum}'
#统计目录个的文件所有的字节数
ls -l | awk  '{sum+=$5}  END{print sum/1024/1024,"M"}'
#以M为单位显示目录下的所有字节数
echo '(7)-----------------------完美分割线--------------------------------'
awk 'BEGIN{a=10;a+=10;print a}'
#20
#a+10等价于 a=a+10
echo '(8)-----------------------完美分割线--------------------------------'
echo|awk 'BEGIN{a="100testaaa"}a~/test/{print "ok"}'
#正则匹配a 是否有test字符'成立打印ok
echo '(9)-----------------------完美分割线--------------------------------'
awk 'BEGIN{a="b";print a=="b"?"ok":"err"}'
#ok
awk 'BEGIN{a="b";print a=="c"?"ok":"err"}'
#err
#三目运算符?:
echo '(10)-----------------------完美分割线--------------------------------'
awk '/root/{print $0}' /etc/passwd
#匹配所有包含root的行
echo '(11)-----------------------完美分割线--------------------------------'
awk -F: '$5~/root/{print $0}' /etc/passwd
# 以分号作为分隔符'匹配第5个字段是root的行
echo '(12)-----------------------完美分割线--------------------------------'
ifconfig enp0s3|awk 'BEGIN{FS="[[:space:]:]+"} NR==2{print $3}'
#打印IP地址
echo '(13)-----------------------完美分割线--------------------------------'
awk '{print toupper($0)}' test.txt
#toupper是awk内置函数'将所小写字母转换成大写
