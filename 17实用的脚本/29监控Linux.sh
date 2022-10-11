#!/bin/bash
#======================================
# File name:shell_29监控Linux.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 20:32
#======================================
#该脚本基本上由三个主要部分组成：
: '
#1.监控内存：
#free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }'
'
#free -m 是用于显示已使用和空闲内存的命令，输出如下：
#[sll@1120:~/github/shell/shell_17实用的脚本]$ free -m
#               total        used        free      shared  buff/cache   available
#内存：       1876        1009          91          13         775         694
#交换：       2139         222        1917

#但是，我们需要从上面的输出中获取第二行的总内存和已用内存。从给定输出字符串中提取数据的一种方法是使用 AWK。
#AWK是一种用于文本处理和数据提取的命令。它是大多数 UNIX 系统的标准功能。awk 'NR==2' 表示从第二行提取数据。$2和$3分别作为已用量和总量。

: '
#2.监控硬盘：
#df -h | awk '$NF=="/"{printf "%s\t\t", $5}'
'
#第二个命令获取磁盘的使用情况。df -h 输出磁盘使用情况和分区相关的数据。
#[sll@1120:~/github/shell/shell_17实用的脚本]$ df -h
#文件系统        容量  已用  可用 已用% 挂载点
#tmpfs           188M  1.8M  186M    1% /run
#/dev/sda3        20G   15G  3.7G   80% /
#tmpfs           939M     0  939M    0% /dev/shm
#tmpfs           5.0M  4.0K  5.0M    1% /run/lock
#/dev/sda2       512M  5.3M  507M    2% /boot/efi
#tmpfs           188M  4.7M  184M    3% /run/user/1000
#/dev/sr0        3.6G  3.6G     0  100% /media/sll/Ubuntu 22.04.1 LTS amd64
#NF是表示有多少个字段，$NF代表最后一个字段。所以，df -h | awk '$NF==”/” '表示输出以"/"结尾的行。$5 将从该行中选择第 5 个字段。这可确保该命令获取正确的磁盘使用百分比（在我们的示例中为 %7）。

: '
3.监控CPU
top -bn1 | grep load | awk "{printf "%.2f%%\t\t\n", $(NF-2)}"
'
#top -bn1 命令将执行一次 top 命令（n1 = 一次迭代），当我们想在 bash 脚本中使用“top”或将其数据输出到文件时使用“b”。
#“grep load”将输出包含字符串“load”的行。$(NF-2) 将计算该行上的字段数并减 2，因此输出第10个字段，即以下输出中的第一个 0.00。
#top -bn1 |grep load
#在浏览完 bash 脚本的基本部分之后，我们需要将这些命令保存到变量 MEMORY、DISK 和 CPU 三个变量中：
#MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
#DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
#CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
#我们希望脚本运行一段时间，比如说一个小时。为了做到这一点，我们需要使用“while do”循环，每次循环后延迟 x 秒：
#end=$((SECONDS+3600))
#while [ $SECONDS -lt $end ] 
#do
#    echo "$MEMORY$DISK$CPU"
#    sleep 5
#done
#为了在一定时间内运行一个循环，我们可以定义一个变量 $end，它从 bash 脚本开始的时间开始计算当前的秒数，即 SECONDS，并在当前秒数上加上一个数字。所以一个小时就是 3600 秒。
#上述代码片段的第二行指出，只要当前秒数小于（当前秒数 + 3600），while 循环就会继续执行。因此，我们定义了循环的开始时间和结束时间，以及将每个循环暂停 5 秒的睡眠时间。循环内部是每 5 秒分配一次新值的三个变量，以及将输出三个资源使用情况的 echo “$MEMORY $DISK $CPU”。

#完整代码如下：
#!/bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
sleep 5
done
#上面的代码将输出以下内容：
#[root@localhost tmp]# ./stats.sh
#Memory Disk CPU
#9.34% 7% 0.00%
#9.34% 7% 0.00%
#9.34% 7% 0.00%
#9.34% 7% 0.00%
#将数据输出到日志文件：
#[root@localhost tmp]# ./stats.sh >> log.txt
#压力测试
#由于我们的机器上没有任何负载，我们可以使用压力测试器stress命令，
#使 CPU 和内存负载运行一段时间。
#stress命令的用法：https://linux.die.net/man/1/stress
#现在我们可以使用命令“stress”来给我们的服务器添加负载。
#例如，通过指定 2 个 CPU-bound 进程、1 个 I/O-bound 进程和 1 个内存分配器进程，
#对系统施加平均负载 4，如下所示。以下压力测试将运行 1 小时。
#[sll@1120:~/github/shell/shell_17实用的脚本]$ stress -c 2 -i 1 -m 1 --vm-bytes 128M -t 3600s
#stress: info: [13037] dispatching hogs: 2 cpu, 1 io, 1 vm, 0 hdd
#stress: info: [1574] successful run completed in 3600s
#[root@localhost tmp]# ./stats.sh 
#Memory Disk CPU
#20.48% 7% 1.21%
#20.48% 7% 1.02%
#20.48% 7% 0.94%
#21.89% 7% 1.18%
#20.68% 7% 1.41%
#22.09% 7% 1.62%
#24.10% 7% 1.81%
#24.90% 7% 1.98%
#32.93% 7% 2.14%
#30.32% 7% 2.29%
#20.58% 7% 2.63%
#27.91% 7% 2.82%
#20.48% 7% 2.59%
#20.48% 7% 2.38%
#20.48% 7% 2.19%
#20.48% 7% 2.02%
#20.48% 7% 1.86%
