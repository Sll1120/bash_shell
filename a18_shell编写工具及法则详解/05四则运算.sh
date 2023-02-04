#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-05 00:46
# * Filename : 05.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
简单的四则运算
算术运算：默认情况下，shell就只能支持简单的==整数==运算

+ - * /  %（取模，求余数） 
Bash shell 的算术运算有四种方式:
1. 使用 $(( ))
2. 使用$[ ]
3. 使用 expr 外部程式
4. 使用let 命令

注意：
n=1
let n+=1  等价于let n=n+1



思考：能不能用shell做小数运算？
[root@server shell01]# echo 1+1.5|bc
2.5


i++ 和 ++i （了解）
对变量的值的影响：
[root@node1 ~]# i=1
[root@node1 ~]# let i++
[root@node1 ~]# echo $i
2
[root@node1 ~]# j=1
[root@node1 ~]# let ++j
[root@node1 ~]# echo $j
2

对表达式的值的影响：
[root@node1 ~]# unset i j
[root@node1 ~]# i=1;j=1
[root@node1 ~]# let x=i++         先赋值，再运算
[root@node1 ~]# let y=++j         先运算，再赋值
[root@node1 ~]# echo $i
2
[root@node1 ~]# echo $j
2
[root@node1 ~]# echo $x
1
[root@node1 ~]# echo $y
2
总结：

$(())  $[]
expr 注意空格，*要进行转义 \

let n+=1  等价   let n=n+1
let n=n**5        n有初值，然后求次幂

i++    ++i 
对变量本身没有影响（自己+1）；
表达式中有影响；i++ 先赋值再运算  ++i先运算再赋值
let x=i++   let x=++i

