#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 16:48
# * Filename : 01awk.sh
# **********************************************************
: '
AWK 工作原理
AWK 工作流程可分为三个部分：
1, 读输入文件之前执行的代码段（由BEGIN关键字标识）。
2, 主循环执行输入文件的代码段。
3, 读输入文件之后的代码段（由END关键字标识）。
命令结构:
awk 'BEGIN{ commands } pattern{ commands } END{ commands }'
awk '条件类型1{动作1} 条件类型2{动作2} ...' filename

1、通过关键字 BEGIN 执行 BEGIN 块的内容，即 BEGIN 后花括号 {} 的内容。
2、完成 BEGIN 块的执行，开始执行body块。
3、读入有 \n 换行符分割的记录。
4、将记录按指定的域分隔符划分域，填充域，$0 则表示所有域(即一行内容)，$1 表示第一个域，$n 表示第 n 个域。
5、依次执行各 BODY 块，pattern 部分匹配该行内容成功后，才会执行 awk-commands 的内容。
6、循环读取并执行各行直到文件结束，完成body块执行。
7、开始 END 块执行，END 块可以输出最终结果。

开始块（BEGIN）
开始块的语法格式如下：
BEGIN {awk-commands}
开始块就是在程序启动的时候执行的代码部分，并且它在整个过程中只执行一次。
一般情况下，我们可以在开始块中初始化一些变量。
BEGIN 是 AWK 的关键字，因此它必须是大写的。
注意：开始块部分是可选的，你的程序可以没有开始块部分。

主体块（BODY）
主体部分的语法格式如下：
/pattern/ {awk-commands}
对于每一个输入的行都会执行一次主体部分的命令。
默认情况下，对于输入的每一行，AWK 都会执行命令。但是，我们可以将其限定在指定的模式中。
注意：在主体块部分没有关键字存在。

结束块（END）
结束块的语法格式如下：
END {awk-commands}
结束块是在程序结束时执行的代码。 END 也是 AWK 的关键字，它也必须大写。与开始块相似，结束块也是可选

1、AWK简介
AWK是一种处理文本文件的语言，是一个强大的文本分析工具。
2、AWK语法
awk [选项参数] 'script' var=value file(s)
或
awk [选项参数] -f scriptfile var=value file(s)

选项参数的说明：
-F fs or –field-separator fs
指定输入文件折分隔符，fs是一个字符串或者是一个正则表达式，如-F:

-v var=value or –asign var=value
赋值一个用户定义变量。

-f scripfile or –file scriptfile
从脚本文件中读取awk命令。

-mf nnn and -mr nnn
对nnn值设置内在限制，-mf选项限制分配给nnn的最大块数目；-mr选项限制记录的最大数目。这两个功能是Bell实验室版awk的扩展功能，在标准awk中不适用。

-W compact or –compat, -W traditional or –traditional
在兼容模式下运行awk。所以gawk的行为和标准的awk完全一样，所有的awk扩展都被忽略。

-W copyleft or –copyleft, -W copyright or –copyright
打印简短的版权信息。

-W help or –help, -W usage or –usage
打印全部awk选项和每个选项的简短说明。

-W lint or –lint
打印不能向传统unix平台移植的结构的警告。

-W lint-old or –lint-old
打印关于不能向传统unix平台移植的结构的警告。

-W posix
打开兼容模式。但有以下限制，不识别：/x、函数关键字、func、换码序列以及当fs是一个空格时，将新行作为一个域分隔符；操作符和=不能代替^和^=；fflush无效。

-W re-interval or –re-inerval
允许间隔正则表达式的使用，参考(grep中的Posix字符类)，如括号表达式[[:alpha:]]。

-W source program-text or –source program-text
使用program-text作为源代码，可与-f命令混用。

-W version or –version
打印bug报告信息的版本。

内建变量
属性	说明
$0 	当前记录（作为单个变量）
$1~$n	当前记录的第n个字段，字段间由FS分隔
FS	输入字段分隔符 默认是空格
NF	当前记录中的字段个数，就是有多少列
NR	已经读出的记录数，就是行号，从1开始
RS	输入的记录他隔符默 认为换行符
OFS	输出字段分隔符 默认也是空格
ORS	输出的记录分隔符，默认为换行符
ARGC	命令行参数个数
ARGV	命令行参数数组
FILENAME	当前输入文件的名字
IGNORECASE	如果为真，则进行忽略大小写的匹配
ARGIND	当前被处理文件的ARGV标志符
CONVFMT	数字转换格式 %.6g
ENVIRON	UNIX环境变量
ERRNO	UNIX系统错误消息
FIELDWIDTHS	输入字段宽度的空白分隔字符串
FNR	当前记录数
OFMT	数字的输出格式(默认值是%.6g)
RSTART	被匹配函数匹配的字符串首
RLENGTH	被匹配函数匹配的字符串长度
SUBSEP	数组下标分隔符(默认值是\034)

awk是行处理器: 相比较屏幕处理的优点，在处理庞大文件时不会出现内存溢出或是处理缓慢的问题，通常用来格式化文本信息
awk处理过程: 依次对每一行进行处理，然后输出
awk命令形式:
awk [-F|-f|-v] ‘BEGIN{} //{command1; command2} END{}’ file
 [-F|-f|-v]   大参数，-F指定分隔符，-f调用脚本，-v定义变量 var=value
'  '          引用代码块
BEGIN   初始化代码块，在对每一行进行处理之前，初始化代码，主要是引用全局变量，设置FS分隔符
//           匹配代码块，可以是字符串或正则表达式
{}           命令代码块，包含一条或多条命令
；          多条命令使用分号分隔
END      结尾代码块，在对每一行进行处理之后再执行的代码块，主要是进行最终计算或输出结尾摘要信息

(1)特殊要点:
$0           表示整个当前行
$1           每行第一个字段
NF          字段数量变量
NR          每行的记录号，多文件记录递增
FNR        与NR类似，不过多文件记录不递增，每个文件都从1开始
\t            制表符
\n           换行符
FS          BEGIN时定义分隔符
RS       输入的记录分隔符， 默认为换行符(即文本是按一行一行输入)
~            匹配，与==相比不是精确比较
!~           不匹配，不精确比较
==         等于，必须全部相等，精确比较
!=           不等于，精确比较
&&　     逻辑与
||             逻辑或
+            匹配时表示1个或1个以上
/[0-9][0-9]+/   两个或两个以上数字
/[0-9][0-9]*/    一个或一个以上数字
FILENAME 文件名
OFS       输出字段分隔符， 默认也是空格，可以改为制表符等
ORS         输出的记录分隔符，默认为换行符,即处理结果也是一行一行输出到屏幕
-F'[:#/]'   定义三个分隔符
'
