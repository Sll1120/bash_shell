#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-12-28 16:19
# * Filename : 07or运算符.sh
# **********************************************************
#OR 运算符是另一个重要的构造，它允许我们在脚本中实现复杂、健壮的编程逻辑。与 AND 相反，由 OR 运算符组成的语句在其任一操作数为真时返回真。仅当由 OR 分隔的每个操作数为 false 时才返回 false。
echo -n "Enter any number:"
read n

if [[ ( $n -eq 15 || $n -eq 45 ) ]]
then
echo "You won"
else
echo "You lost!"
fi

#这个简单的示例演示了 OR 运算符如何在 Linux shell 脚本中工作。只有当用户输入数字 15 或 45 时，它才会宣布用户为获胜者。|| 符号表示 OR 运算符。
#
