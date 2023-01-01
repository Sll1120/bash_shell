#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-01 11:37
# * Filename : 49确认存在后创建目录.sh
# **********************************************************
#!/bin/bash
echo -n "Enter directory name ->"
read dir
if [ -d "$dir" ]; then
	echo "Directory exists"
else
	$(mkdir $dir)
	# `mkdir $dir`
	echo "Directory created"
fi

