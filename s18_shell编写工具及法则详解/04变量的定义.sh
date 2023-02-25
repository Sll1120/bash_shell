#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-05 00:20
# * Filename : 04变量的定义.sh
# **********************************************************
#1. 变量的分类
: <<!
本地变量：当前用户自定义的变量。当前进程中有效，其他进程及当前进程的子进程无效。

环境变量：当前进程有效，并且能够被子进程调用。

查看当前用户的环境变量                        env

查询当前用户的所有变量(临时变量与环境变量)         set

export    //将当前变量变成环境变量
!

echo '(1)-----------------------完美分割线--------------------------------'
export A=hello        #临时将一个本地变量（临时变量）变成环境变量
env|grep ^A
A=hello

: '
永久生效：
vim /etc/profile 或者 ~/.bashrc
export A=hello
或者
A=hello
export A
'

: '
全局变量：全局所有的用户和程序都能调用，且继承，新建的用户也默认能调用.
$HOME/.bashrc             当前用户的bash信息（aliase、umask等）
$HOME/.bash_profile      当前用户的环境变量（）
oracle——>oracle用户——>$oracle/.bash_profile——>export home_install=/u01/app/xxx
$HOME/.bash_logout          每个用户退出当前shell时最后读取的文件
/etc/bashrc             使用bash shell用户全局变量
grep --color=auto
umask
/etc/profile              系统和每个用户的环境变量信息
mycat_home=/usr/local/mycat/bin
export mycat_home
执行mycat命令
# mycat
$ mycat
用户登录系统读取相关文件的顺序：
/etc/profile——>$HOME/.bash_profile——>$HOME/.bashrc——>/etc/bashrc——>$HOME/.bash_logout
source /etc/bashrc
'

: <<!
系统变量(内置bash中变量) ：shell本身已经固定好了它的名字和作用.
$?：上一条命令执行后返回的状态，当返回状态值为0时表示执行正常，非0值表示执行异常或出错
 若退出状态值为0，表示命令运行成功
 若退出状态值为127,表示command not found
 若退出状态值为126,表示找到了该命令但无法执行（权限不够）
 若退出状态值为1&2,表示没有那个文件或目录

$$：当前所在进程的进程号     echo $$   eg：kill -9 `echo $$`  = exit   退出当前会话
$!：后台运行的最后一个进程号  （当前终端）  # gedit &
!$    调用最后一条命令历史中的参数
!!    调用最后一条命令历史

$#：脚本后面接的参数的个数
$*：脚本后面所有参数，参数当成一个整体输出，每一个变量参数之间以空格隔开
$@: 脚本后面所有参数，参数是独立的，也是全部输出

$0：当前执行的进程/程序名  echo $0        
$1~$9 位置参数变量
${10}~${n} 扩展位置参数变量  第10个位置变量必须用{}大括号括起来
!
echo '(2)-----------------------完美分割线--------------------------------'
#!/bin/bash
echo "\$0 = $0"
echo "\$# = $#"
echo "\$* = $*"
echo "\$@ = $@"
echo "\$1 = $1" 
echo "\$2 = $2" 
echo "\$3 = $3" 
echo "\$11 = ${11}" 
echo "\$12 = ${12}" 

: '
了解$*和$@的区别：
$*    :表示将变量看成一个整体
$@    :表示变量是独立的
'
echo '(3)-----------------------完美分割线--------------------------------'
#!/bin/bash
for i in "$@"
do
echo $i
done
echo '(4)-----------------------完美分割线--------------------------------'
for i in "$*"
do
echo $i
done

#2. 什么时候需要定义变量？
#如果某个内容需要多次使用，并且在代码中重复出现，那么可以用变量代表该内容。这样在修改内容的时候，仅仅需要修改变量的值。
#在代码运作的过程中，可能会把某些命令的执行结果保存起来，后续代码需要使用这些结果，就可以直接使用这个变量。

#3. 变量的定义规则
: '
1. 默认情况下，shell里定义的变量是不分类型的，可以给变量赋与任何类型的值；等号两边不能有空格，对于有空格的字符串做为赋值时，要用引号引起来
变量名=变量值

2. 变量的获取方式：    $变量名     ${变量名}   
'
echo '(5)-----------------------完美分割线--------------------------------'
a=12345678
echo $a
echo ${a}
echo ${a:2:3}        a表示变量名；2表示从第3个字符开始；3表示后面3个字符
: '
如果获取变量的全部两个都可以；如果获取变量的某一部分，用${}

3. 取消变量:     unset  变量名

4. 变量名区分大小写，同名称但大小写不同的变量名是不同的变量

5. 变量名可以是字母或数字或下划线，但是不能以数字开头或者特殊字符
'
echo '(6)-----------------------完美分割线--------------------------------'
1a=hello
?a=hello
_a=hello
echo $_a
: '
6. 命令的执行结果可以保存到变量
'
kernel=`uname -r`
echo $kernel
name=$(uname -n)
echo $name
: '
7. 有类型变量 declare
-i 将变量看成整数 
-r 使变量只读  readonly
-x 标记变量通过环境导出  export
-a    指定为索引数组（普通数组）；查看普通数组
-A 指定为关联数组；查看关联数组
'
echo '(7)-----------------------完美分割线--------------------------------'
a=10
b=20
echo $a+$b

declare -i a=2
declare -i b=4
declare -i c=$a+$b
echo $c

AAAA=hello
export AAAA
env|grep AAAA
declare -x BBBB=hello
env|grep BBBB

#8. 数组
: <<!
普通数组：只能使用整数作为数组索引(元素的下标)
关联数组：可以使用字符串作为数组索引(元素的下标)

普通数组定义：用括号来表示数组，数组元素(变量)用“空格”符号分割开。定义数组的一般形式为：
一次赋一个值：
变量名=变量值
!
echo '(8)-----------------------完美分割线--------------------------------'
array[0]=v1
array[1]=v2
array[3]=v3
#一次赋多个值：
array=(var1 var2 var3 var4)
array1=(`sudo cat /etc/passwd`)            #将文件中每一行赋值给array1数组
array2=(`sudo ls /root`)
array3=(harry amy jack "Miss Hou")
array4=(1 2 3 4 "hello world" [10]=linux)

echo '(9)-----------------------完美分割线--------------------------------'
#读取数组：
#echo ${array[i]}  #i表示元素的下标
#使用@ 或 * 可以获取数组中的所有元素：
#获取第一个元素

echo ${array[0]}
echo ${array[*]}        # 获取数组里的所有元素
echo ${#array[*]}       # 获取数组里所有元素个数
echo ${!array[@]}       # 获取数组元素的索引下标
echo ${array[@]:1:2}    # 访问指定的元素；1代表从下标为1的元素开始获取；2代表获取后面几个元素

echo '(10)-----------------------完美分割线--------------------------------'
array[0]=var1
array[1]=var2
array[2]=var3
array1=(uu1 uu2 uu3 uu4)
ls -l
array2=(`ls ./`)
array3=(jack harry "Miss Hou" [5]=tom)

#查看普通数组信息：
echo '(11)-----------------------完美分割线--------------------------------'
declare -a
echo ${array[*]}
echo ${array[@]}
echo ${array[2]}
echo ${array2[@]}
echo ${array2[3]}
echo ${array2[*]:2:2}
echo ${#array2[*]}
echo ${!array2[*]}
echo ${!array3[*]}

#关联数组定义：

#首先声明关联数组
echo '(12)-----------------------完美分割线--------------------------------'
declare -A asso_array1
declare -A asso_array2
declare -A asso_array3

#数组赋值：
#一次赋一个值：
#数组名[索引|下标]=变量值
asso_array1[linux]=one
asso_array1[java]=two
asso_array1[php]=three

#一次赋多个值：
asso_array2=([name1]=harry [name2]=jack [name3]=amy [name4]="Miss Hou")
#查看关联数组：
echo '(13)-----------------------完美分割线--------------------------------'
declare -A
declare -A asso_array1='([php]="three" [java]="two" [linux]="one" )'
declare -A asso_array2='([name3]="amy" [name2]="jack" [name1]="harry" [name4]="Miss Hou" )'

echo ${asso_array1[linux]}
echo ${asso_array1[php]}
echo ${asso_array1[*]}
echo ${!asso_array1[*]}
echo ${#asso_array1[*]}
echo ${#asso_array2[*]}
echo ${!asso_array2[*]}

#9. 交互式定义变量的值 read    主要用于让用户去定义变量值
: '
-p 提示信息
-n 字符数 （限制变量值的字符数）
-s 不显示   
-t 超时（默认单位秒）（限制用户输入变量值的超时时间）
'
echo '(14)-----------------------完美分割线--------------------------------'
cat array.txt 

read -p "Input your IP and Netmask:" ip mask < array.txt 
echo $ip
echo $mask

#10. 其他变量（扩展）
: '
1）取出一个目录下的目录和文件：dirname和 basename 
2）变量"内容"的删除和替换
一个“%”代表从右往左去掉一个/key/
两个“%%”代表从右往左最大去掉/key/
一个“#”代表从左往右去掉一个/key/
两个“##”代表从左往右最大去掉/key/
'

echo '(15)-----------------------完美分割线--------------------------------'
A=/home/sll/git/shell/a18_shell编写工具及法则详解/array.txt 
echo $A
dirname $A   #取出目录
basename $A  #取出文件

echo '(16)-----------------------完美分割线--------------------------------'
url=www.taobao.com
echo ${#url}             #获取变量的长度
echo ${url#*.}
echo ${url##*.}
echo ${url%.*}
echo ${url%%.*}
#替换：/ 和 //
echo ${url/ao/AO}
echo ${url//ao/AO}   #贪婪替换
#替代： - 和 :-  +和:+

echo '(17)-----------------------完美分割线--------------------------------'
echo ${abc-123}
abc=hello
echo ${abc-444}
echo $abc
abc=
echo ${abc-222}
#${变量名-新的变量值} 或者 ${变量名=新的变量值}
#变量没有被赋值：会使用“新的变量值“ 替代
#变量有被赋值（包括空值）： 不会被替代

echo '(18)-----------------------完美分割线--------------------------------'
echo ${ABC:-123}
ABC=HELLO
echo ${ABC:-123}
ABC=
echo ${ABC:-123}
#${变量名:-新的变量值} 或者 ${变量名:=新的变量值}
#变量没有被赋值或者赋空值：会使用“新的变量值“ 替代
#变量有被赋值： 不会被替代

echo '(19)-----------------------完美分割线--------------------------------'
echo ${abc=123}
echo ${abc:=123}

unset abc
echo ${abc:+123}

abc=hello
echo ${abc:+123}
abc=
echo ${abc:+123}
#${变量名:+新的变量值}
#变量没有被赋值：不会使用“新的变量值“ 替代
#变量有被赋值（包括空值）： 会被替代

echo '(20)-----------------------完美分割线--------------------------------'
unset abc
echo ${abc+123}

abc=hello
echo ${abc+123}

abc=
echo ${abc+123}
#${变量名+新的变量值}
#变量没有被赋值或者赋空值：不会使用“新的变量值“ 替代
#变量有被赋值： 会被替代

echo '(21)-----------------------完美分割线--------------------------------'
unset abc
echo ${abc?123}

abc=hello
echo ${abc?123}
abc=
echo ${abc?123}
#${变量名?新的变量值}
#变量没有被赋值:提示错误信息
#变量被赋值（包括空值）：不会使用“新的变量值“ 替代

echo '(22)-----------------------完美分割线--------------------------------'
unset abc
echo ${abc:?123}
abc=hello
echo ${abc:?123}
abc=
echo ${abc:?123}
#${变量名:?新的变量值}
#变量没有被赋值或者赋空值时:提示错误信息
#变量被赋值：不会使用“新的变量值“ 替代

#说明：?主要是当变量没有赋值提示错误信息的，没有赋值功能
