#!/bin/bash
#======================================
# File name:02sed.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-23 11:35
#======================================
: '
sed是Linux三剑客之一。
       Sed是一种非交互式的流编辑器，可动态编辑文件；流编辑器则会在编辑器处理数据之前基于预先提供的一组 规则来编辑数据流 。
       Sed本身是一个管道命令，可以分析 standard input 的，主要是用来分析关键字的使用、统计等，此外还可 以将数据进行替换、删除、选中、选取特定行等功能

       1.sed -[]常用的参数及其作用：
-n ：安静模式。在sed的一般用法中，所有来自文件中的数据都会被列出到屏幕上，如果加上-n，则只有经过sed特殊处理的那行（或操作）才会被列出来。
-e ：直接下命令行模式上进行sed的动作编辑。
-f ：直接将sed的动作写在一个文件内，-f filename 则可以执行file内的sed动作。
-r ：sed的动作支持的是扩展型正则表达式的语法（默认是基础正则表达式的语法）。
-i ：可直接对源文件内容进行修改。。危险操作
-h或–help：显示帮助；
-V或–version：显示版本信息

2.function有下面这些参数
i ：插入，在目标行的上面新增一行。
a ：插入，在目标行的下面新增一行。
d ：删除所选行。
p ：打印，也就是将某个选择的数据打印出来，通常参数-p与参数-n搭配使用。
s ：替换，可以直接进行替换的工作。
c ：替换，c的后面可以接替字符串，这些字符串可以替换n1，n2之间的行。
w ：写并追加模板块到file末尾。
W ： 写并追加模板块的第一行到file末尾。
! ：表示后面的命令对所有没有被选定的行发生作用。
= ：打印当前行号; # 把注释扩展到下一个换行符以前。
以上参数皆不改变原文件内容

3.sed替换标记
g ：表示行内全面替换;
x： 表示互换模板块中的文本和缓冲区中的文本;
y ：表示把一个字符翻译为另外的字符（但是不用于正则表达式）;
\1： 子串匹配标记;
& ：已匹配字符串标记;

4.sed元字符集
^ 匹配行开始，如：/^ sed/匹配所有以sed开头的行
$ 匹配行结束，如：/sed$/匹配所有以sed结尾的行;
.： 匹配一个非换行符的任意字符，如：/s.d/匹配s后接一个任意字符，后是d;
*：匹配0个或多个字符，如：/*sed/匹配所有模板是一个或多个空格后紧跟sed的行;
[] 匹配一个指定范围内的字符，如/[ss]ed/匹配sed和Sed;
[^] 匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头，紧跟ed的行;
\ (…\ ) 匹配子串，保存匹配的字符，如s/(love)able/\1rs，loveable被替换成lovers;
& 保存搜索字符用来替换其他字符，如s/love/&/，love这成love;
< 匹配单词的开始，如:/\
> 匹配单词的结束，如/love>/匹配包含以love结尾的单词的行;
x{m} 重复字符x，m次，如：/0{5}/匹配包含5个0的行;
x{m,} 重复字符x，至少m次，如：/0{5,}/匹配至少有5个0的行; x{m,n} 重复字符x，至少m次，不多于n次，如：/0{5,10}/匹配5~10个0的行;

'
#5.各参数的使用
#对function参数的使用
#1）打印行 :
#-n 'n1 p’打印第n行，且原文件内容不变；
#-n ‘n1,n2 p’打印n1到n2行，且原文件内容不变
#2）删除行：
#-n ’ n1 d’ 删除第n行，且原文件内容不变；
#-n ‘n1,n2 d’ 删除n1到n2行，且原文件内容不变
#3）插入行：
#‘ni 内容’ 第n行前添加一行内容，且原文件内容不变 ；
#‘na 内容’ 第n行后添加一行内容，且原文件内容不变
#4）替换行：
#‘nc 新内容’ 将第n行替换成新内容，且原文件内容不变
#5）替换字符
#-n ‘s/old/new/p’ :将文件中每行的第一个old字符换成new字符，打印出只发生变化的行，且源文件内容不变。

#-n ‘s/old/new/pg’ :将文件中全部的old字符换成new字符，打印出只发生变化的行，且源文件内容不变。

#-n ‘s/old/new/p2g’ :将文件中每行从第2个old字符开始换成new字符，打印出只发生变化的行，且源文件内容不变。

#对sed动作参数的使用
#6）直接对源文件内容进行操作（-i）

#7）不对源文件内容进行操作（-e）
#6.测试
#1）只显示ifconfig中的IP地址
ifconfig | grep 'inet'|grep -v '127.0'|sed 's/netmask.*//'|grep -v 'inet6'| sed 's/.*inet//'|sed 's/^.//'
ifconfig | grep 'inet'|grep -v 'inet6'|grep -v '127.0.0'|awk '{print $2}'
#2）去掉ssh配置文件中的带#行和空行
sed 's/#.*//g' /etc/ssh/sshd_config | sed '/^$/d'
#3）每一行结尾为.的换成!（“ . ” 需要加转义符 ）
#
#4）在以m开头的行末尾加上3颗星
#
#
#
#
#5.接下来做几道练习题熟悉一下sed的用法
##sed_text，拷贝以下内容并进行练习
#
#Steve Blenheim:238-923-7366:95 Latham Lane, Easton, PA 83755:11/12/56:20300
#
#Betty Boop:245-836-8357:635 Cutesy Lane, Hollywood, CA 91464:6/23/23:14500
#
#Igor Chevsky:385-375-8395:3567 Populus Place, Caldwell, NJ 23875:6/18/68:23400
#
#Norma Corder:397-857-2735:74 Pine Street, Dearborn, MI 23874:3/28/45:245700
#
#Jennifer Cowan:548-834-2348:583 Laurel Ave., Kingsville, TX 83745:10/1/35:58900
#
#Jon DeLoach:408-253-3122:123 Park St., San Jose, CA 04086:7/25/53:85100
#
#Karen Evich:284-758-2857:23 Edgecliff Place, Lincoln , NB 92743:7/25/53:85100
#
#Karen Evich:284-758-2867:23 Edgecliff Place, Lincoln, NB 92743:11/3/35:58200
#
#Karen Evich:284-758-2867:23 Edgecliff Place, Lincoln, NB 92743:11/3/35:58200
#
#Fred Fardbarkle:674-843-1385:20 Parak Lane, Duluth, MN 23850:4/12/23:780900
#
#Fred Fardbarkle:674-843-1385:20 Parak Lane, Duluth, MN 23850:4/12/23:780900
#
#Lori Gortz:327-832-5728:3465 Mirlo Street, Peabody, MA 34756:10/2/65:35200
#
#Paco Gutierrez:835-365-1284:454 Easy Street, Decatur, IL 75732:2/28/53:123500
#
#Ephram Hardy:293-259-5395:235 CarltonLane, Joliet, IL 73858:8/12/20:56700
#
#James Ikeda:834-938-8376:23445 Aster Ave., Allentown, NJ 83745:12/1/38:45000
#
#Barbara Kertz:385-573-8326:832 Ponce Drive, Gzary, IN 83756:12/1/46:268500
#
#Lesley Kirstin:408-456-1234:4 Harvard Square, Boston, MA 02133:4/22/62:52600
#
#William Kopf:846-836-2837:6937 Ware Road, Milton, PA 93756:9/21/46:43500
#
#Sir Lancelot:837-835-8257:474 Camelot Boulevard, Bath, WY 28356:5/13/69:24500
#
#Jesse Neal:408-233-8971:45 Rose Terrace, San Francisco, CA 92303:2/3/36:25000
#
#Zippy Pinhead:834-823-8319:2356 Bizarro Ave., Farmount, IL 84357:1/1/67:89500
#
# Arthur Putie:923-835-8745:23 Wimp Lane, Kensington, DL 38758:8/31/69:126000
#
#Popeye Sailor:156-454-3322:945 Bluto Street, Anywhere, USA 29358:3/19/35:22350
#
#Jose Santiago:385-898-8357:38 Fife Way, Abilene, TX 39673:1/5/58:95600
#
#Tommy Savage:408-724-0140:1222 Oxbow Court, Sunnyvale, CA 94087:5/19/66:34200
#
#Yukio Takeshida:387-827-1095:13 Uno Lane, Ashville, NC 23556:7/1/29:57000
#
#Vinh Tranh:438-910-7449:8235 Maple Street, Wilmington, VM 29085:9/23/63:68900

# #1.把Jon的名字改为Jonathan
# #2.删除头3行
# #3.打印第5~10行
# #4.删除含有Lane的所有行
# #5.打印所有生日在十一月或十二月的行
# #6.将所有包含Jose的行都替换为JOSE HAS RETIRED
# #7.把Popeye的生日改为11/14/46，假定您不知道Popeye的生日，设法用正则式查找出来
# #8.删除所有空行
