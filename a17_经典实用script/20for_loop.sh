#!/bin/bash
#======================================
# File name:shell_20for_loop.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 18:35
#======================================
#!/bin/bash
s=0;
for((i=1;i<100;i++))
do 
 s=$[$s+$i]
done 
echo $s
echo '-------------------------------------' 
r=0;
a=0;
b=0;
for((x=1;x<9;x++))
do 
 a=$[$a+$x] 
echo $x
done
echo '-------------------------------------' 
for((y=1;y<9;y++))
do 
 b=$[$b+$y]
echo $y
done
echo r=$[$a+$b]
