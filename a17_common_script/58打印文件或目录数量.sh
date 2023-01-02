#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 17:22
# * Filename : 58打印文件或目录数量.sh
# **********************************************************
#查找给定目录中存在的文件或文件夹的数量。利用 Linux find 命令来执行此操作。首先，您需要传递目录名称以从命令行搜索文件。
if [ -d "$@" ]; then
	echo "Files found: $(find "$@" -type f | wc -l)"
	echo "Folders found: $(find "$@" -type d | wc -l)"
else
	echo "[ERROR] Please retry with another folder."
	exit 1
fi
