#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-02 17:02
# * Filename : 54wait命令.sh
# **********************************************************
#wait 命令用于从 Linux bash 脚本暂停系统进程。
#自己运行这个程序，看看它是如何工作的。
#!/bin/bash
echo "Testing wait command"
sleep 5 &
pid=$!
kill $pid
wait $pid
echo $pid was terminated.

