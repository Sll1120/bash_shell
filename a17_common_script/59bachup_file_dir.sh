#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 18:18
# * Filename : 59bachup_file_dir.sh
# **********************************************************
#Shell 脚本提供了一种强大的方法来备份您的文件和目录。以下示例将备份过去 24 小时内修改过的每个文件或目录。该程序利用 find 命令来执行此操作。
#备份过程成功后，它将打印文件和目录的名称。

#!/bin/bash
BACKUPFILE=backup-$(date +%m-%d-%Y)
archive=${1:-$BACKUPFILE}

find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."
exit 0
