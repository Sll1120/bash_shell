#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 13:56
# * Filename : 01_find_explain.sh
# **********************************************************
#1. 按名称或正则表达式查找文件
#让我们从最简单的用法开始。要按特定名称搜索文件，命令如下：
echo '1--------------------------------'
find . -name sll_1.txt
#上面代码的.符号表示当前路径。如果我们想在其他路径下搜索文件，只需指出：
echo '2--------------------------------'
find /home/sll/gitee/shell/21commands -name sll_1.txt
#如何查找所有格式为 txt 的书籍？使用正则表达式：(正则需要加引号)
echo '3--------------------------------'
find . -name "*.txt"
#默认情况下，该find命令搜索常规文件，但最好指定类型，以使查找更精确：
echo '4--------------------------------'
find . -type f -name "*.txt"

#2. 查找不同类型的文件
#除了搜索普通文件外，我们还可以通过指定-type选项来搜索其他类型的文件。
#比如目录：
echo '5--------------------------------'
find . -type d -name "sll*"
#或符号链接：
echo '6--------------------------------'
find . -type l -name "sll*"

#3.按特定时间戳查找文件
#要按特定时间戳搜索文件，我们需要知道Linux 系统中的3 个不同的时间戳：
#访问时间戳（atime）：最后一次读取文件的时间。
#修改时间戳（mtime）：文件内容最后一次修改的时间。
#更改时间戳 (ctime)：上次更改文件元数据的时间，例如其所有权、位置、文件类型和权限设置。
#所以，正如开头提到的面试问题，要搜索atime一年多以前的文件，我们可以编写如下命令：
echo '7--------------------------------'
find . -type f -atime +365
#如果我们需要查找mtime恰好是 5 天前的文件，请不要包含+，因为+“”的意思是“大于”。
echo '8--------------------------------'
find . -type f -mtime 5
#显然，+的意思是“大于”，-意思是“小于”。所以我们可以搜索ctime 5 到 10 天前的文件：
echo '9--------------------------------'
find . -type f -ctime +5 -ctime -10

#4. 按大小查找文件
#-size选项使我们能够按特定大小查找文件。我们可以将其度量单位指定为以下形式：
#b: 512 字节块（默认）
#c: B
#w: 2字节
#k: KB
#M: MB
#G: GB
#类似于按时间戳查找文件，+意思是“大于”和-“小于”。例如，要查找大小在 10 MB 到 1 GB 之间的文件：
echo '10--------------------------------'
find . -type f -size +10w -size -10k

#5. 按权限查找文件
#正确控制文件的权限是 Linux 管理员的一项重要任务。
#该命令的-perm选项find可以帮助我们按特定权限搜索文件：
echo '11--------------------------------'
find . -type f -perm 777
#例如，上面的命令搜索所有具有 777 权限的文件，
#这意味着一个文件对其所有者、组和所有用户具有所有的读、写和可执行权限

#6. 按所有权查找文件
#这个任务很简单。我们可以使用该-user选项指定一个用户名。例如，以下命令将查找属于的所有文件sll：
echo '12--------------------------------'
find -type f -user sll

#7.找到文件后执行命令
#在大多数情况下，我们希望在找到我们需要的文件后进行一些操作。
#例如删除它们，检查它们的详细信息等等。-exec命令可以完成这个任务。
#现在，要了解如何使用它，让我们回到之前提到的面试问题：
echo '13--------------------------------'
find . -type f -atime +365 -exec rm -rf {} \;
#上面的-exec选项后面的命令是rm -rf，用于删除文件。{}是查找结果的占位符。
#注意：占位符{}非常重要，尤其是在您想删除文件时。因为如果您不使用它，该命令将针对所有文件而不是您刚刚通过该find命令找到的文件执行。
#要尝试一下，请在终端上执行以下两个命令并检查它们的结果有什么不同：
#一种是使用占位符：
echo '14--------------------------------'
find . -type f -atime +5 -exec ls {} \;
#另一个不使用占位符：
echo '15--------------------------------'
find . -type f -atime +5 -exec ls \;
#选项后面的命令-exec必须以分号结束。众所周知，转义字符用于去除单个字符的特殊含义。
#反斜杠“\”在 Linux 中用作转义字符。所以我们将它用于分号转义
#结论
#看完find命令的 7 种用法，一开始提到的面试题现在好像很容易了。你现在可以直接写下它的答案并解释清楚吗？
echo '16--------------------------------'
find . -type f -atime +365 -exec rm -rf {} \;
find . -type f -name "*.txt" -exec rm -rf {} \;

#==============================================================
#Linux 系统下查找文件 命令总结，这个很哇塞a！
#查命令绝对路径：
#which用于查找并显示给定命令的绝对路径,环境变量中PATH参数也可以被查出来。
which bash
#/usr/bin/bash
which ls
#/usr/bin/ls
#寻找特定文件：
#whereis命令用来定位指令的二进制程序、源代码文件和man手册页等相关文件的路径,该命令只能用于程序名的搜索
whereis --help
#用法：
# whereis [选项] [-BMS <dir>... -f] <名称>
#定位某个命令的二进制文件、源码和帮助页文件。
#选项：
# -b         只搜索二进制文件
# -B <目录>  定义二进制文件查找路径
# -m         只搜索手册和信息
# -M <目录>  定义 man 和 info 查找路径
# -s         只搜索源代码
# -S <目录>  定义源代码查找路径
# -f         终止 <目录> 参数列表
# -u         搜索不常见记录
# -l         输出有效查找路径
# -h, --help     display this help
# -V, --version  display version
#更多信息请参阅 whereis(1)。
whereis -b ifconfig
#ifconfig: /usr/sbin/ifconfig
whereis -m ifconfig
#ifconfig: /usr/share/man/man8/ifconfig.8.gz
#缓存查找文件：
#locate 搜索一个数据库/var/lib/mlocatedb,这个数据库中含有本地所有文件信息,Linux系统自动创建这个数据库,并且每天自动更新一次,所以使用locate命令查不到最新变动过的文件,为了避免这种情况,可以在使用locate之前,先使用updatedb命令,手动更新数据库,updatedb命令会根据/etc/updatedb.conf来更新文件.
#[sll@shark:~/gitee/shell/21commands]$ locate --help
#Usage: plocate [OPTION]... PATTERN...
#
#  -b, --basename         search only the file name portion of path names
#  -c, --count            print number of matches instead of the matches
#  -d, --database DBPATH  search for files in DBPATH
#                         (default is /var/lib/plocate/plocate.db)
#  -i, --ignore-case      search case-insensitively
#  -l, --limit LIMIT      stop after LIMIT matches
#  -0, --null             delimit matches by NUL instead of newline
#  -N, --literal          do not quote filenames, even if printing to a tty
#  -r, --regexp           interpret patterns as basic regexps (slow)
#      --regex            interpret patterns as extended regexps (slow)
#  -w, --wholename        search the entire path name (default; see -b)
#      --help             print this help
#      --version          print version information
#使用 locate 命令查询一个文件.
sudo updatedb
locate /etc/passwd
#/etc/passwd
#/etc/passwd-
#/snap/core20/1587/etc/passwd

#遍历文件查找:
# find 命令可以说是最重要的查找命令了，该命令参数较多。
: '
find --help
语法格式：[ find [目录] [属性] 文件名 ]
        -name         #按文件名查找
        -size         #根据大小查找
        -user         #根据属主查找
        -perm         #根据权限查找
        -type         #根据类型查找
        -time         #按时间查找
        -inum         #根据i节点查询
        -exec         #查找后执行命令
'

#-name 按文件名查找：
: '
常用查询通配符
\*     #匹配任意一个或多个字符
？     #匹配任意一个字符
[]     #指定范围,外侧加引号
'
#查找/var/目录下,以.log结尾的文件.
sudo find /var/ -name "*.log"
#/var/log/unattended-upgrades/unattended-upgrades-dpkg.log
#/var/log/unattended-upgrades/unattended-upgrades-shutdown.log
#/var/log/unattended-upgrades/unattended-upgrades.log
#/var/log/apt/history.log
#/var/log/apt/term.log
#/var/log/vboxadd-setup.log
#/var/log/alternatives.log
#/var/log/vboxadd-install.log
#/var/log/ubuntu-advantage-timer.log
#....省略....
#查找/root/目录下,以[1-3之间],结尾是.txt的文件
#[root@localhost ~]# find /root/ -name "[1-3].txt"
#/root/1.txt
#/root/2.txt
#/root/3.txt
#查找/etc/目录下,开头是6个任意字符的文件
#[root@localhost ~]# find /etc/ -name "??????"
#/etc/grub.d
#/etc/grub.d/README
#/etc/shells
#/etc/init.d
#....省略....
#
#
#-size 根据大小查找
#
#单位是 block 数据块  一块是512字节
#1M -> 1024k -> 2048 块  (1块是0.5k 也就是512字节)
#100M -> 102400k -> 204800块
#查找/etc/目录下,小于10k的文件
#
#root@localhost ~]# find /etc/ -size -10k
#/etc/crypttab
#/etc/.pwd.lock
#/etc/environment
#....省略....
#查找/etc/目录下,大于1M的文件
#
#[root@localhost ~]# find /etc/ -size +1M   #查询大于1M的文件
#/etc/udev/hwdb.bin
#/etc/selinux/targeted/active/policy.kern
#/etc/selinux/targeted/contexts/files/file_contexts.bin
#/etc/selinux/targeted/policy/policy.31
#....省略....
#
##注意：+-号如果没有,是精确到这么大,通常都会带上+或-号表示一个范围.
#
#
#-user 根据属主与权限查找
#
#在/root目录中查找属于wang用户的文件
#
#微信搜索公众号：前端技术编程，回复：前端 领取资料 。
#
#[root@localhost ~]# find /root/ -user wang
#/root/1.txt
#/root/2.txt
#/root/3.txt
##注意：系统中要存在该用户,否则会报错误.
#查找/boot/目录中权限是644的文件
#
#[root@localhost ~]# find /boot/ -perm 0644
#/boot/grub2/device.map
#/boot/grub2/i386-pc/gcry_rmd160.mod
#/boot/grub2/i386-pc/acpi.mod
#/boot/grub2/i386-pc/gcry_rsa.mod
#....省略....
#
#
#-type 根据类型查找
#
#-type f 二进制文件（普通文件）
#-type l 软链接文件
#-type d 目录
#查找/usr/bin/目录下,类型是二进制文件.
#
#[root@localhost ~]# find /usr/bin/ -type f
#/usr/bin/cp
#/usr/bin/gzip
#/usr/bin/alias
#/usr/bin/csplit
#/usr/bin/bash
#....省略....
#
#
#-time 按时间查找
#
#按天数   ctime  atime  mtime
#按分钟   cmin   amin     mmin
#
#  c  change   #表示属性被修改过：所有者、所属组、权限
#  a  access   #被访问过(被查看过)
#  m  modify   #表示内容被修改过
#查找/etc/目录下,在120分钟以内,内容被修改过的文件
#
#[root@localhost ~]# find /etc/ -mmin -120
#/etc/
#/etc/resolv.conf
#/etc/group-
#/etc/gshadow-
#/etc/group
#/etc/gshadow
#....省略....
#查找/etc/目录下,在7天之前,属性被修改过的文件
#
#[root@localhost ~]# find /etc/ -ctime +7
#/etc/resolv.conf
#/etc/group-
#/etc/gshadow-
#....省略....
#
#
#-inum 根据i节点查询
#
#有一些文件的硬链接数量很多，有相同的i节点，查找其中一个文件的i节点号，一次性删除。微信搜索公众号：Linux技术迷，回复：linux 领取资料 。
#
#[root@localhost ~]# find ./ -inum 1024 -exec rm{} \;   #删除相同I节点的数据
#
#
#-and or 逻辑连接符
#
#-a    （and 逻辑与）
#-o    （or  逻辑或)
#在/etc/目录下,查找大于1k,并且小于10k的文件
#
#[root@localhost ~]# find /etc/ -size +1k -a -size -10k
#/etc/
#/etc/grub.d/00_header
#/etc/grub.d/20_ppc_terminfo
#/etc/grub.d/00_tuned
#/etc/rc.d/init.d/README
#/etc/rc.d/init.d/netconsole
#/etc/rc.d/init.d/network
#/etc/pam.d
#....省略....
#
#
#-exec 命令执行连接符
#
#[查询格式] find  ...  -exec 命令 {}  \;
#
#{}        #表示find查询的结果集
#\         #是转义符,不使用命令别名,直接使用命令本身
#;         #分号是表示语句的结束.
#
##注意：固定格式,只能这样写.注意中间的空格.
#（公众号：网络工程师阿龙）-----------------------------------------------------------------
#说明： 转义符的作用是什么？
#
#在linux中有一个别名机制，如rm删除文件，执行的却是rm -i(用which rm 可以查看命令别名)，
#使用rm删除文件前会提示，就是因为rm -i这个参数。如果想使用命令原意，可以在加\转义，
#如：\rm test.txt   则不会提示，直接删除
#查找/var/log/目录下名字以.log结尾的文件,找到后执行 ls -l 显示详细信息.
#
#[root@localhost ~]# find /var/log/ *.log -exec ls -l {} \;
#total 1176
#drwxr-xr-x. 2 root   root      204 Sep 18 09:12 anaconda
#drwx------. 2 root   root       23 Sep 18 09:12 audit
#-rw-------. 1 root   root    53001 Sep 19 00:57 boot.log
#-rw-------. 1 root   utmp      384 Sep 18 09:22 btmp
#drwxr-xr-x. 2 chrony chrony      6 Apr 12 13:37 chrony
#-rw-------. 1 root   root     3523 Sep 19 01:01 cron
#-rw-r--r--  1 root   root   119414 Sep 19 00:57 dmesg
#-rw-r--r--  1 root   root   119599 Sep 18 23:35 dmesg.old
#-rw-r--r--. 1 root   root     1320 Sep 19 00:23 firewalld
#-rw-r--r--. 1 root   root      193 Sep 18 09:05 grubby_prune_debug
#....
#查找/etc/目录下名字以"init*"开头的文件,找到后,只列出文件,过滤掉目录,并执行 ls -l 显示详细信息.
#
#[root@localhost ~]# find /etc/ -name "init*" -a -type f -exec ls -l {} \;
#
#-rw-r--r--. 1 root root 511 Apr 11 01:09 /etc/inittab
#-rw-r--r--. 1 root root 798 Apr 11 01:09 /etc/sysconfig/init
#-rwxr-xr-x. 1 root root 5419 Jan  2  2018 /etc/sysconfig/network-scripts/init.ipv6-global
#-rw-r--r--. 1 root root 30 Apr 11 14:12 /etc/selinux/targeted/contexts/initrc_context
#查找/tmp/下,的yum.log文件,找到后直接删除.
#
#[root@localhost tmp]# find /tmp/ -name yum.log -exec rm {} \;
#[root@localhost tmp]#
#查找根下,找关于lyshark用户的所有文件,找到后直接删除.
#
#[root@localhost ~]# find / -user lyshark -exec rm -r {} \;
#
#find: ‘/proc/1465/task/1465/fd/6’: No such file or directory
#find: ‘/proc/1465/task/1465/fdinfo/6’: No such file or directory
#find: ‘/proc/1465/fd/5’: No such file or directory
#find: ‘/proc/1465/fdinfo/5’: No such file or directory
#find: ‘/root/Catalog’: No such file or directory
#find: ‘/home/lyshark’: No such file or directory
##rm -r 连带目录一起删除.报错原因：-exec 不适合大量传输,速率慢导致.
#在根下,查找lyshark用户的文件,找到后删除,删除前会提示是否删除.
#
#[root@localhost ~]# find / -user lyshark -ok rm -r {} \;
#find: ‘/proc/1777/task/1777/fd/6’: No such file or directory
#find: ‘/proc/1777/task/1777/fdinfo/6’: No such file or directory
#
#< rm ... /root/LyShark > ? y
## -ok的使用和-exec是一样的,区别是-ok,执行时会提示你是否进行下一步操作.
