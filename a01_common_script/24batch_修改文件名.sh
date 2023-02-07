#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-07 10:44
# * Filename : 24batch_修改文件名.sh
# **********************************************************
echo '(1)-----------------------完美分割线--------------------------------'
#for file in ` ls -d $(ls --file-type | grep ".*/$") -l `  #批量修改目录名
#for file in ` ls -d $(ls --file-type | grep ".*[^/]$") -l ` #批量修改文件名
#do
#	mv ${file}  ` echo $file | sed 's/shell_//g' `   #sed命令进行文件名替换
#done
files=$(find . -name "*.csv") #寻找csv类型的文件
for file in $files; do        #遍历files
	#grep $1 $file | awk -F, '{print $2,$5,$6}'      #将输入参数1与当前文件内容进行匹配
	mv $file $(echo ${file#*_})
done

#目的：把article改为bbs
#方法1：
echo '(2)-----------------------完美分割线--------------------------------'
touch article_{1..3}.html
ls -l *.html
for file in $(ls *html); do
	mv $file bbs_${file#*_}
	# mv $file $(echo $file |sed -r 's/.*(_.*)/bbs\1/')
	# mv $file $(echo $file |echo bbs_$(cut -d_ -f2)
done
ls -l *.html
sleep 5
rm *.html

#方法2：
echo '(3)-----------------------完美分割线--------------------------------'
touch article_{4..7}.html
ls -l *.html
for file in $(find . -name "*html"); do
	mv $file bbs_${file#*_}
done
ls -l *.html
sleep 5
rm *.html

#方法3：
# rename article bbs *.html

#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
: '
1）准备测试文件，文件名为sed_eg.txt
第1行1234567不包含字母
第2行56789BBBBBB
第3行67890CCCCCCCC
第4行78asdfDDDDDDDDD
第5行123456EEEEEEEE
第6行1234567ASDF
第7行56789ASDF
第8行67890ASDF
第9行78asdfADSF
第10行123456AAAA
第11行67890ASDF
第12行78asdfADSF
第13行123456AAAA
'
echo '(4)-----------------------完美分割线--------------------------------'
#2）脚本如下：
#!/bin/bash
#把一个文档前五行中包含字母的行删掉，同时删除6到10行包含的所有字母
sed -n '1,5'p sed_eg.txt | sed '/[a-zA-Z]/'d
sed -n '6,10'p sed_eg.txt | sed s'/[a-zA-Z]//'g
sed -n '11,$'p sed_eg.txt
#最终结果只是在屏幕上打印结果，如果想直接更改文件，可将输出结果写入临时文件中，
#再替换sed_eg.txt或者使用-i选项

