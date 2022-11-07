#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-24 14:30
# * Filename : Linux三剑客命令实战案例02.sh
# **********************************************************
#1、找出/proc/meminfo文件中以s开头的行，至少用三种方式忽略大小写
echo '(1)-----------------------完美分割线--------------------------------'
grep -E '^[sS]' /proc/meminfo 
echo '(2)-----------------------完美分割线--------------------------------'
sed -r -n '/^[sS]/p' /proc/meminfo
echo '(3)-----------------------完美分割线--------------------------------'
awk '/^[sS]/{print $0}' /proc/meminfo
echo '(4)-----------------------完美分割线--------------------------------'
grep -iE '^s' /proc/meminfo 
#2、显示当前系统上的以root,ubuntu或者user开头的信息
echo '(5)-----------------------完美分割线--------------------------------'
sudo grep -rE '^(root|ubuntu|user)' /etc/
#3、找出/etc/init.d/*.sh文件下包含小括号的行
echo '(6)-----------------------完美分割线--------------------------------'
grep -E '\(|\)' /etc/init.d/*.sh 
#4、输出指定目录的基名
echo '(7)-----------------------完美分割线--------------------------------'
pwd | awk -F/ '{print $NF}'
#5、找出网卡信息中包含的数字
echo '(8)-----------------------完美分割线--------------------------------'
ifconfig | grep -oE '[0-9]{1,}'
#或者
echo '(9)-----------------------完美分割线--------------------------------'
ifconfig | grep -oE '[0-9]+'
#6、找出/etc/passwd下每种解析器的用户个数
echo '(10)-----------------------完美分割线--------------------------------'
awk -F: '{arr[$NF]++}END{for(i in arr){print i,arr[i]}}' /etc/passwd
#7、获取网卡中的ip，用三种方式实现
echo '(11)-----------------------完美分割线--------------------------------'
ip a | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'
ip a | sed -r -n '/([0-9]{1,3}\.){3}[0-9]{1,3}/p'
ip a | awk '/([0-9]{1,3}\.){3}[0-9]{1,3}/{if(NR==3){print $2}else{print $2,$4}}'
ifconfig | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}'
#8、搜索/etc目录下，所有的.html或.php文件中main函数出现的次数
echo '(12)-----------------------完美分割线--------------------------------'
sudo grep -rE 'main' `find /etc/ -name "*.html" -o -name "*.php" | xargs ` | wc -l
#9、过滤掉.bashrc 中注释的行和空行
echo '(13)-----------------------完美分割线--------------------------------'
grep -vE '^#;|^$' ~/.bashrc
#10、找出文件中至少有一个空格的行
echo '(14)-----------------------完美分割线--------------------------------'
grep -E '\ +' ~/.bashrc
#11、过滤文件中以#开头的行，后面至少有一个空格
echo '(15)-----------------------完美分割线--------------------------------'
grep -E '^#\ +' /etc/fstab 
#12、查询出/etc目录中包含多少个root
echo '(16)-----------------------完美分割线--------------------------------'
sudo grep -roE 'root' /etc/ | wc -l
#13、查询出所有的qq邮箱
#grep -E '[0-9a-zA-Z-_]+@qq\.com'
#14、查询系统日志中所有的error	
echo '(17)-----------------------完美分割线--------------------------------'
grep -E 'error' /var/log/messages
#15、删除某文件中以s开头的行的最后一个词
echo '(18)-----------------------完美分割线--------------------------------'
grep -Ei '^s' test.txt | grep -oE '[0-9a-zA-Z]+' | xargs | awk '{for(i=0;i<(NF-1);i++){print $i}}'

#16、删除一个文件中的所有数学
echo '(19)-----------------------完美分割线--------------------------------'
sed -r 's/[0-9]//g' test.txt 
#17、显示奇数行
echo '(20)-----------------------完美分割线--------------------------------'
awk -F: 'NR%2==1{print $0}' /etc/passwd
#显示偶数行
echo '(20-1)-----------------------完美分割线--------------------------------'
awk -F: 'NR%2==0{print $0}' /etc/passwd
#18、删除passwd文件中以bin开头的行到nobody开头的行
echo '(21)-----------------------完美分割线--------------------------------'
sed -r '/^bin/,/^nobody/d' /etc/passwd
#19、从指定行开始，每隔两行显示一次空行
echo '(22)-----------------------完美分割线--------------------------------'
awk -F: '{n=5;if(NR<n){print $0}else{if((NR-5)%2==0){print " "};print $0}}' /etc/passwd
#20、每隔5行打印一个空行
echo '(23)-----------------------完美分割线--------------------------------'
awk -F: '{if(NR%5==0){print " "}; print $0}' /etc/passwd
#21、不显示指定字符的行
echo '(24)-----------------------完美分割线--------------------------------'
grep -vE 'g' test.txt 
#22、将文件中1到5行中a替换成A
echo '(25)-----------------------完美分割线--------------------------------'
sed -r '1,5s/a/A/g' test.txt
#23、显示用户id为奇数的行
echo '(26)-----------------------完美分割线--------------------------------'
awk -F: '$3%2==1{print $0}' /etc/passwd
#24、显示系统普通用户，并打印系统用户名和id
echo '(27)-----------------------完美分割线--------------------------------'
awk -F: '$3>=1000{print $1, $3}' /etc/passwd
#25、统计apache2日志中独立用户数(ip维度计算)
echo '(28)-----------------------完美分割线--------------------------------'
awk '/([0-9]{1,3}\.){3}[0-9]{1,3}/{arr[$1]++}END{for(i in arr){print i}}' /var/log/apache2/access.log
#26、统计~/.bashrc 中每个词的个数
echo '(29)-----------------------完美分割线--------------------------------'
grep -oE '[0-9a-zA-Z]+' ~/.bashrc | awk '{arr[$1]++}END{for(i in arr){printf "%-15s | %-5d\n", i, arr[i]}}' | head -20
