#!/bin/bash
for arg in "$@"
do
index=$(echo $arg | cut -f1 -d=)
val=$(echo $arg | cut -f2 -d=)
# -d, --delimiter=分界符	使用指定分界符代替制表符作为区域分界
# -f, --fields=列表    只选中指定的这些域；并打印所有不包含分界符的行，除非-s 选项被指定
case $index in
X) x=$val;;
Y) y=$val;;
*)
esac
done
((result=x+y))
echo "X+Y=$result"
