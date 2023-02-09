#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-09 10:57
# * Filename : test.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'

shell脚本之选择与执行
Jagger • 2016-09-19 13:49 • Linux干货
流程控制

 过程式编程语言： 顺序执行 选择执行 循环执行
选择执行：if语句 

注意：if语句可嵌套 
单分支

if 判断条件：then

条件为真的分支代码

fi 
双分支

if 判断条件; then

条件为真的分支代码

else

条件为假的分支代码

fi
多分支

if CONDITION1; then

if-true

elif CONDITION2; then

if-ture

elif CONDITION3; then

if-ture

…

else all-false

fi 

逐条件进行判断，第一次遇为“真”条件时，执行其分支， 而后结束整个if语句
if实例

根据命令的退出状态来执行命令

if ping -c1 -W2 station1 &> /dev/null; then

echo 'Station1 is UP' 

elif grep "station1" ~/maintenance.txt &> /dev/null

then

echo 'Station1 is undergoing maintenance‘

else

echo 'Station1 is unexpectedly DOWN!'

exit 1

fi
选择执行：case语句

1.语法

case  $变量  in

PAT1) 分支1

;;

PAT2) 分支2

;;

…

*) 默认分支

;;

esac

2.case支持glob风格的通配符：

*: 任意长度任意字符

?: 任意单个字符

[]：指定范围内的任意单个字符

a|b: a或b
练习

1、写一个脚本/root/bin/createuser.sh，实现如下功能： 使用一个用户名做为参数，如果指定参数的用户存在，就显 示其存在，否则添加用户；显示添加的用户的id号等信息

#!/bin/bash

useradd $1 &> /dev/null

if [ $? -eq 0 ]

then

echo 'user $1 added successful'

id $1

else

echo 'user exsit'

fi

                                              

2、写一个脚本/root/bin/yesorno.sh，提示用户输入yes或 no,并判断用户输入的是yes还是no,或是其它信息

#!/bin/bash

read -p "please input  yes or no! " a

case $a in

[Yy][Ee][Ss]|[Yy])

echo 'yes'

;;

[Nn][Oo]|[Nn])

echo 'no'

;;

*)

echo 'others'

esac

3、写一个脚本/root/bin/filetype.sh,判断用户输入文件路 径，显示其文件类型（普通，目录，链接，其它文件类型）

#！/bin/bash

read -p "please enter file:  " filename

if [ -L $filename ];then

   echo "$filename is Symbol file."

elif [ -c $filename ];then

   echo "$filename is char file."

elif [ -d $filename ];then

   echo "$filename is dir file."

elif [ -b $filename ];then

   echo "$filename is  block file."

elif [ -f $filename ];then

   echo "$filename is common file."

elif [ -P $filename ];then

   echo "$filename is pipe file."

elif [ -S $filename ];then

   echo "$filename is socket file."

else

  echo "please enter a Correct file"

fi4、写一个脚本/root/bin/checkint.sh,判断用户输入的参数 是否为正整数

read -p 'please input numbers' n

[ -z "$n" ] && echo 'you must input numbers' && exit

[ "$n" -eq 0 ] &> /dev/null && echo "$n is 零" && exit

if let var=$n &> /dev/null;then

  if [ "$?" -eq 0 ];then

     if [ "$n" -lt 0 ];then

           echo "$n is 负整数"

     else

           echo "$n is 正整数"

     fi

  fi

else

echo "$n 不是一个整数"

fi

循环执行

将某代码段重复运行多次

重复运行多少次： 循环次数事先已知 ，循环次数事先未知 。

进入条件：条件满足时才进入循环

退出条件：每个循环都应该有退出条件

for, while, until
for循环 

两种方式：（1）遍历列表

for 变量名 in 列表;do

循环体

done 

进入条件：只要列表有元素，即可进入循环

退出条件：列表中的元素遍历完成

          （2）控制变量

执行机制：依次将列表中的元素赋值给“变量名”; 每次赋值后即执 行一次循环体; 直到列表中的元素耗尽，循环结束。

列表生成方式：(1) 直接给出列表

(2) 整数列表 (a) {start..end}

(b) $(seq [start [step]] end)

                                             

(3) 返回列表的命令 $(COMMAND)

(4) 使用glob，如：*.sh

(5) 变量引用； $@, $*

练习:用for实现 

    1.     判断/var/目录下所有文件的类型

for filename in /var/log/*;do

if [ -L $filename ];then

   echo "$filename is Symbol file."

elif [ -c $filename ];then

   echo "$filename is char file."

elif [ -d $filename ];then

   echo "$filename is dir file."

elif [ -b $filename ];then

   echo "$filename is  block file."

elif [ -f $filename ];then

   echo "$filename is common file."

elif [ -P $filename ];then

   echo "$filename is pipe file."

elif [ -S $filename ];then

   echo "$filename is socket file."

else

  echo "please enter a Correct file"

fi

done

2.添加10个用户user1-user10，密码同用户名

if [[ $# -lt 1 ]]

then

    echo -e "Error: No option \n\t-d\tdelete user1-user10\n\t-a\tadd user1-user10 "

    exit 1

fi

for i in $(seq 10);do

    case $1 in

        -d|–del)

            if id user$i &> /dev/null;then

                userdel -r user$i

                echo "user$i: Delete complete!"

            else

                echo "user$i: No such user!"

            fi

            ;;

        -a|–add)

            if id user$i &> /dev/null;then

                echo "user$i"| passwd –stdin "user$i" &> /dev/null

                echo -e  "user$i: Already existed!\nAnd authentication tokens updated successful!"

            else

                useradd user$i &> /dev/null

                echo "user$i"| passwd –stdin "user$i" &> /dev/null

                echo " user$i: Add complete!"

            fi

            ;;

        *)

3./etc/rc.d/rc3.d目录下分别有多个以K开头和以S开头的 文件；分别读取每个文件，以K开头的文件输出为文件加stop ，以S开头的文件输出为文件名加start；

“K34filename stop”

  “S66filename start”

for i in `ls /etc/rc.d/rc3.d`

do

    FileC1=`echo $i | cut -c1`

    case $FileC1 in

        K)

            echo -e "$i\tstop"

            ;;

        S)

            echo -e "$i\tstart"

            ;;

        *)

            echo "unkown file"

            ;;

    esac

done

4.写一个脚本，提示输入正整数n的值，计算1+2+3+…n的 总和

#!/bin/bash

read -p 'please input the number' n

num=`echo $n|grep "^[[:digit:]]\+$"`

if echo $n|grep -q  "^[[:digit:]]\+$" ;then

        if [ $num -eq 0 ];then

                echo "the number is 0"

                exit

        fi

else

        echo "the number is negtive"

        exit

fi

string=0

for i in `seq $n`;do

        sum=$[$sum+$i]

        string=$string+$i

done

echo "$string=$sum"

5.写一个脚本，提示请输入网络地址，如192.168.0.0，判 断输入的网段中主机在线状态 

echo -n "Enter IP:"

read IP

#get IP segment

Segment=`echo $IP | cut -d. -f1-3 `.

#

if echo $IP | egrep '\<([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){2}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\>' &>/dev/null

then

    #test only  5 host

    for i in `seq 240 255`

    do

        if ping -c 1 -W 1 $Segment$i &> /dev/null

        then

            echo -e "$Segment$i\tonline"

        else

            echo -e "$Segment$i\toffline"

        fi

    done

else

    echo "$IP is invalid"

fi

6.打印九九乘法表

#!/bin/bash

for j in {1..9};do

      for i in $(seq 1 $j);do

           echo -n -e "${i}X${j}=$[${i}*${j}]\t"

      done

      echo

done

while循环 

while CONDITION; do  

循环体

done 

进入条件：CONDITION测试为真

退出条件：CONDITION测试为假

CONDITION：循环控制条件；进入循环之前，先做一次判 断；每一次循环之后会再次做判断；条件为“true”，则执行 一次循环；直到条件测试状态为“false”终止循环,因此：CONDTION一般应该有循环控制变量；而此变量的值 会在循环体不断地被修正 .

进入条件：CONDITION为true； 

退出条件：CONDITION为false
练习：用while实现 

1.求100以内所有正整数之和 

shell脚本之选择与执行

2.通过ping命令探测172.16.250.1-254范围内的所有主机 的在线状态，统计在线主机和离线主机各多少。

shell脚本之选择与执行

3.打印九九乘法表

shell脚本之选择与执行

4.利用变量RANDOM生成10个随机数字，输出这个10数字 ，并显示其中的最大者和最小者

shell脚本之选择与执行

5.打印国际象棋棋盘

shell脚本之选择与执行

until循环 

until CONDITION; do

循环体 

Done

进入条件：CONDITION测试为假

退出条件：CONDITION测试为真
练习：用until实现

    1.     每隔3秒钟到系统上获取已经登录的用户的信息；如果发 现用户hacker登录，则将登录时间和主机记录于日志 /var/log/login.log中,并提示该用户退出系统。

#!/bin/bash

while true ;do

      if who | grep "^hacker\>" &> /dev/null;then

                   break

      fi

      sleep 3

done

echo "$(date +"%F %T") hacker logged on" >> /tmp/users.log

#!/bin/bash

      until who | grep "^hacker\>" &> /dev/null;do

         sleep 3

done

echo "$(date +"%F %T) hacker logged on" >> /tmp/users.log

2.随机生成10以内的数字，实现猜字游戏，提示比较大或小 ，相等则退出。

shell脚本之选择与执行

break循环控制语句

 用于循环体中 

break [N]：提前结束第N层循环，最内层为第1层

while CONDTIITON1; do

CMD1

…

if CONDITION2; then

break

fi

CMDn

…

Done

整个until循环结束

exit是退出整个脚本

  退出内循环，执行外循环

死循环创建

while true; do

循环体 

Done

退出方式：某个测试条件满足时，让循环体制性break命令

 

until false; do

循环体 

Done
for特殊用法
1.while循环的特殊用法（遍历文件的每一行）：

while read line; do

循环体

done < /PATH/FROM/SOMEFILE 

依次读取/PATH/FROM/SOMEFILE文件中的每一行，且将 行赋值给变量line

练习

扫描/etc/passwd文件每一行，如发现GECOS字段为空，则填 充用户名和单位电话为62985600，并提示该用户的GECOS信 息修改成功。

shell脚本之选择与执行
2.双小括号方法

即((…))格式，也可以用于算术运算 

双小括号方法也可以使bash Shell实现C语言风格的变量操作

#I=10

#((I++))

for循环的特殊格式：

for ((控制变量初始化;条件判断表达式;控制变量的修正表达式))

do

循环体

done 

 

控制变量初始化：仅在运行到循环代码段时执行一次。 

控制变量的修正表达式：每轮循环结束会先进行控制变量修正运算 ，而后再做条件判断。
select 循环与菜单 

select variable in list

do

循环体命令

done 

select 循环主要用于创建菜单，按数字顺序排列的 菜单项将显示在标准错误上，并显示 PS3 提示符， 等待用户输入。

用户输入菜单列表中的某个数字，执行相应的命令 。

用户输入被保存在内置变量 REPLY 中。

Select与case：

select 是个无限循环，因此要记住用 break 命令退 出循环，或用 exit 命令终止脚本。也可以按 ctrl+c 退出循环。 

select 经常和 case 联合使用 

与 for 循环类似，可以省略 in list ，此时使用位置 参量
函数介绍

函数function是由若干条shell命令组成的语句块，实现代码重用和模块化编程。把一段独立功能的代码当做一个整体，并为之一个名字；命名的代码段，此即为函数。

它与shell程序形式上是相似的，不同的是它不是一个单独的进程，不能独立运行，而是shell程序的一部分。 

函数和shell程序比较相似，区别在于： 

Shell程序在子Shell中运行 

而Shell函数在当前Shell中运行。因此在当前Shell中，函数可以对shell中变量进行修改
定义函数

 函数由两部分组成：函数名和函数体。 

语法一： function  f_name {

…函数体…

} 

语法二： function f_name  ()  {

 …函数体…

 } 

语法三： f_name  ()   {

…函数体…

}

如图，函数中不能直接使用$1等数字参数，所以用过度的中间参数。
函数使用

函数的定义和使用： 可在交互式环境下定义函数 （测试环境下使用）

可将函数放在脚本文件中作为它的一部分

可放在只包含函数的单独文件中 

调用：函数只有被调用才会执行；

调用：给定函数名

函数名出现的地方，会被自动替换为函数代码 

函数的生命周期：每次被调用时创建，返回时终止
函数返回值

函数有两种返回值： 

1.函数的执行结果返回值： (1) 使用echo或printf命令进行输出

(2) 函数体中调用命令的输出结果 

2.函数的退出状态码： (1) 默认取决于函数中执行的最后一条命令的退出状态码

(2) 自定义退出状态码，其格式为： return  从函数中返回，用最后状态命令决定返回值；

 return 0  无错误返回。

return 1-255  有错误返回.

交互式环境下定义和使用函数

 示例： $dir() {

          > ls –l

          > }

定义该函数后，若在$后面键入dir，其显示结果同ls -l的 作用相同。 $dir 

该dir函数将一直保留到用户从系统退出，或执行了如下 所示的unset命令： $ unset dir
在脚本中定义及使用函数

 函数在使用前必须定义，因此应将函数定义放在脚本开始部分，直至 shell首次发现它后才能使用 

调用函数仅使用其函数名即可。 

示例： $cat func1

#!/bin/bash

# func1

hello() {

echo "Hello there today's date is `date +%F`"

}

echo "now going to the function hello"

hello

echo "back from the function"  
使用函数文件

可以将经常使用的函数存入函数文件，然后将函 数文件载入shell。 文件名可任意选取，但最好与相关任务有某种联 系。例如：functions.main 

一旦函数文件载入shell，就可以在命令行或脚本 中调用函数。可以使用set命令查看所有定义的函 数，其输出列表包括已经载入shell的所有函数。 

若要改动函数，首先用unset命令从shell中删除 函数。改动完毕后，再重新载入此文件。
创建函数文件

 函数文件示例：

$cat  functions.main

#!/bin/bash

#functions.main

findit()

{

if [ $# -lt 1 ] ;  then

echo "Usage:findit file"

return 1

fi

find / -name $1 –print

}
载入函数

函数文件已创建好后，要将它载入shell 

定位函数文件并载入shell的格式： . filename 或 source   filename  注意：此即<点> <空格> <文件名> 这里的文件名要带正确路径 

示例：上例中的函数，可使用如下命令： $ . functions.main
检查载入函数

 使用set命令检查函数是否已载入。set命令将在shell中显示 所有的载入函数。 

示例：

$set

findit=( ) {

if [ $# -lt 1 ]; then

echo "usage :findit file";

return 1

fi

find / -name $1 -print

}

…
执行shell函数

要执行函数，简单地键入函数名即可： 

示例： $findit groups

/usr/bin/groups

/usr/local/backups/groups.bak
删除shell函数

现在对函数做一些改动。首先删除函数，使其对shell不可用 。使用unset命令完成此功能. 

命令格式为： unset  function_name

实例： $unset findit 再键入set命令，函数将不再显示
函数参数

 函数可以接受参数： 传递参数给函数：调用函数时，在函数名后面以空白分隔 给定参数列表即可；例如“testfunc arg1 arg2 …” 在函数体中当中，可使用$1, $2, …调用这些参数；还 可以使用$@, $*, $#等特殊变量。

示例1：添加10个用户

     添加用户的功能使用函数实现，用户名作为参数传递给函数

#!/bin/bash

#2:user exist

#函数定义

addusers() {

        #判断用户是否存在

        if id $1 &> /dev/null; then

        #存在就返回一个2

                return 2

        else

                #不存在就添加用户

                useradd $1

                #用户是否添加成功

                retuval=$?

                #返回添加成功的值

                return $retuval

        fi

}

#引用函数

for i in {1..10};do

        addusers ${1}${i}

        #位置参数不能直接被引用

        retuval=$?

        #调用addusers的参数，如果$?=0则表示用户添加成功

        if [ $retuval -eq 0 ];then

                #${1}是用户名，${i}是用户后面跟着的数字如user1，user是给定的用户名

                echo "add user ${1}${i} finished"

        elif [ $retuval -eq 2 ];then

                echo "user ${1}${i} exists"

        else

                echo "unknow error"

        fi

done

函数变量

变量作用域：

环境变量：当前shell和子shell有效

本地变量：只在当前shell进程有效，为执行脚本会启动

专用子shell进程；因此，本地变量的作用范围是当前shell脚本 程序文件，包括脚本中的函数。 

局部变量：作用域是函数的生命周期；函数结束时变量被自动销毁。 

注意：如果函数中有局部变量，如果其名称同本地变量，使 用局部变量。 

在函数中定义局部变量的方法 local NAME=VALUE


函数递归

  函数递归： 函数直接或间接调用自身 注意递归层数 

递归实例： 阶乘是基斯顿·卡曼于 1808 年发明的运算符号，是数学术语 一个正整数的阶乘（factorial）是所有小于及等于该数的正整 数的积，并且有0的阶乘为1。自然数n的阶乘写作n!。 n!=1×2×3×…×n。 阶乘亦可以递归方式定义：0!=1，n!=(n-1)!×n。 n!=n(n-1)(n-2)…1 n(n-1)! = n(n-1)(n-2)!

   示例： fact.sh

#!/bin/bash

#

fact() {

if [ $1 -eq 0 -o $1 -eq 1 ]; then

echo 1

else

echo $[$1*$(fact $[$1-1])]

fi

}

fact $1 

