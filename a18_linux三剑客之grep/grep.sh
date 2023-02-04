#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-22 11:05
# * Filename : grep.sh
# **********************************************************
: <<!
一、grep基本介绍
作用:文本搜索工具，根据用户指定的“模式（过滤条件)”对目标文本逐行进行匹配检查，打印匹配到的行.

grep格式
grep [option] pattern filename
grep的option选项说明
--color   显示颜色的参数，即搜索出来的关键字符带有颜色。使用"grep --color 关键字符" 或者 "grep --color=auto 关键字符"。一般配置别名alias grep="grep --color"

-a   不要忽略二进制数据。使用"grep -a 关键字符"

-A   显示符合关键字符的行, 以及其后面的n行。使用 "grep -An 关键字符" 或者 "grep -A n 关键字符"

-b   显示符合关键字符的行, 以及其前后的各n行。使用"grep -bn 关键字符", 注意这个不能使用"grep -b n 关键字符"! 跟-C参数差不多，但是会多打印出行号！！！

-B   显示符合关键字符的行, 以及其前面的n行。 使用 "grep -An 关键字符" 或者 "grep -A n 关键字符"

-c   只输出匹配行的计数。即只显示出匹配关键字符的那行的行数，不显示内容！使用"grep -c 关键字符"

-C   显示符合关键字符的行, 以及其前后的各n行。使用 "grep -Cn 关键字符" 或者 "grep -C n 关键字符"。跟-b参数差不多，-b参数会多打印行号出来！

-d   当指定要查找的是目录而非文件时，必须使用这项参数，否则grep命令将回报信息并停止动作。-d后面跟的是进行的动作，一般是"grep -d read"或"grep -d recure"，后面会有小示例说明。

-e   指定字符串作为查找文件内容的关键字符。使用"grep -e 关键字符"。grep -e "正则表达式" 文件

-E   将关键字符为延伸的普通表示法来使用，意味着使用能使用扩展正则表达式！！通常用于满足多个条件中的其中一个条件进行搜索。使用grep -E "条件1|条件2|条件2"

-f   显示两个文件中相同的行。使用 "grep -f filename1 filename2 " 或者 "grep --file filename1 filename2",相等于"cat filename1 filename2|sort|uniq -d"，即取交集!

-F   将关键字符视为固定字符串的列表。使用"grep -F 关键字 filename1" 或者 "grep -F 关键字符 filename1 filename2 filenamen", 会显示出来关键字所在的文件的列表。

-G   将关键字符视为普通的表示法来使用。

-h   对多文件搜索关键字符时不显示文件名，只显示关键字符。使用"grep -h 关键字符 filename1 filename2 filenamen", 不显示文件名，只显示关键字符。

-H   对多文件搜索关键字符时显示文件名和关键字符，跟-h参数相反。 使用"grep -H 关键字符 filename1 filename2 filenamen", 显示"文件名:关键字符"。

-i   忽略关键字符的大小写。(跟-y参数相同)。使用"grep -i"

-l   对多文件搜索关键字符时只显示文件名。使用"grep -l 关键字符 filename1 filename2 filenamen"，只显示文件名，不显示关键字符。

-L   对多文件搜索关键字符时，只显示不匹配关键字符的文件名。使用"grep -L 关键字符 filename1 filename2 filenamen"，只显示不匹配关键字符的文件。

-n   显示匹配关键字符的行号和行内容。使用"grep -n 关键字符 filename"

-q   不显示任何信息。用于if逻辑判断,安静模式，不打印任何标准输出。如果有匹配的内容则立即返回状态值0。

-R/-r   此参数的效果和指定"-d recurse"参数相同。

-s   当搜索关键字符，匹配的文件不存在时不显示错误信息。即不显示不存在或无匹配文本的错误信息。 使用"grep -s 关键字符 filename"

-v   反转或过滤搜索，即过滤出来那些不匹配关键字符的行。使用"grep -v 关键字符"

-w   精准搜索关键字符，即只显示完全匹配关键字符的行,不显示那些包含关键字符的行。使用"grep -w 关键字符", 或者使用grep "\<关键字符\>"，或者使用grep "\b关键字符\b"

-x   只显示整行都是关键字符的行。使用"grep -x 关键字符"。

-y   忽略关键字符的大小写。(跟-i参数相同)。"grep -y"。

-o   只输出文件中匹配到的部分, 不会打印多余的内容。

-P   使用perl的正则表达式语法，因为perl的正则更加多元化，能实现更加复杂的场景。典型用法是匹配指定字符串之间的字符。（-e或-E是匹配扩展正则表达式，-P是匹配perl正则表达式）
模式:由正则表达式的元字符及文本字符所编写出的过滤条件﹔
grep命令是Linux系统中最重要的命令之一，功能是从文本文件或管道数据流中筛选匹配的行和数据，如果再配合正则表达式，功能十分强大，是Linux运维人员必备的命令
grep命令里的匹配模式就是你想要找的东西，可以是普通的文字符号，也可以是正则表达式

二、grep正则表达式元字符集（基本集）

^  匹配行的开始 如：'^grep'匹配所有以grep开头的行。

$  匹配行的结束 如：'grep$'匹配所有以grep结尾的行。

.  匹配一个非换行符的字符 如：'gr.p'匹配gr后接一个任意字符，然后是p。

*  匹配零个或多个先前字符 如：'*grep'匹配所有一个或多个空格后紧跟grep的行。 .*一起用代表任意字符。

[]  匹配一个指定范围内的字符，如'[Gg]rep'匹配Grep和grep。即[mn]表示匹配m或者n关键字符，相当于grep -E "m|n"。注意[]里面不要放太多关键字符，容易混乱！只要放[]里面的都是要匹配的关键字符！

[^]  匹配一个不在指定范围内的字符，如：'[^A-FH-Z]rep'匹配不包含A-F和H-Z的一个字母，但是包含rep并且rep不在开头（即*req）的行。

\(..\)  标记匹配字符，如'\(love\)'，love被标记为1。

\《  匹配单词的开始，如:'\
" '
\》 匹配单词的结束，如'str\>'匹配包含以str结尾的单词的行。通常使用"\<关键字符\>"作为精准匹配，相当于grep -w

x\{m\}  重复字符x，m次，如：'0\{5\}'匹配包含5个o的行。

x\{m,\}  重复字符x,至少m次，如：'o\{5,\}'匹配至少有5个o的行。

x\{m,n\}  重复字符x，至少m次，不多于n次，如：'o\{5,10\}'匹配5--10个o的行。

\w  匹配文字和数字字符，也就是[A-Za-z0-9]，如：'G\w*p'匹配以G后跟零个或多个文字或数字字符，然后是p。

\W  \w的反置形式，匹配一个或多个非单词字符，如点号句号等。

\b 单词锁定符，如: \byang\b 表示只匹配yang。相当于grep -w "yang" 或者 grep "\<yang\>"

+  匹配一个或多个先前的字符。如：'[a-z]+able'，匹配一个或多个小写字母后跟able的串，如loveable,enable,disable等。注意：先前字符必须使用()或[]括起来，并且使用grep -E。

?  匹配零个或一个先前的字符。如：'(gr)?p'匹配gr后跟一个或没有字符，然后是p的行。注意：先前字符必须使用()或[]括起来，并且使用grep -E。

a|b|c  匹配a或b或c。如grep -E "a|b|c", 匹配a或b或c中的任意一个都可以。grep -v "a\|b\|c" 或 egrep -v "a|b|c" 过滤掉a或b或c中的任意一个进行搜索。

()  分组符号，如：love(able|rs)ov+匹配loveable或lovers，匹配一个或多个ov。
!
#示例：
 grep -i root /etc/passwd                #忽略大小写匹配包含root的行
 grep -w ftp /etc/passwd                 #精确匹配ftp单词
 grep -w hello /etc/passwd                # 精确匹配hello单词;自己添加包含hello的行到文件中
 grep -wo ftp /etc/passwd                # 打印匹配到的关键字ftp
 grep -n root /etc/passwd                 #打印匹配到root关键字的行好
 grep -ni root /etc/passwd                # 忽略大小写匹配统计包含关键字root的行
 grep -nic root /etc/passwd               # 忽略大小写匹配统计包含关键字root的行数
 grep -i ^root /etc/passwd                # 忽略大小写匹配以root开头的行
 grep bash$ /etc/passwd                            # 匹配以bash结尾的行
 grep -n ^$ /etc/passwd                            # 匹配空行并打印行号
# grep ^# /etc/vsftpd/vsftpd.conf        匹配以#号开头的行
# grep -v ^# /etc/vsftpd/vsftpd.conf    匹配不以#号开头的行
 grep -A 5 mail /etc/passwd                     #匹配包含mail关键字及其后5行
 grep -B 5 mail /etc/passwd                     #匹配包含mail关键字及其前5行
 grep -C 5 mail /etc/passwd                     #匹配包含mail关键字及其前后5行
