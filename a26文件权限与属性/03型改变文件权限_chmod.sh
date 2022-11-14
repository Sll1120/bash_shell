#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-14 23:23
# * Filename : 03型改变文件权限_chmod.sh
# **********************************************************
: '一，数字类型改变文件权限
Linux 文件的基本权限就有九个，分别是owner/group/others 三种身份各有自己的read/write/execute 权限，先
复习一下刚刚上面提到的数据：文件的权限字符为：『-rwxrwxrwx』， 这九个权限是三个三个一组的！其中，
我们可以使用数字来代表各个权限，各权限的分数对照表如下：
r:4
w:2
x:1
每种身份(owner/group/others)各自的三个权限(r/w/x)分数是需要累加的，例如当权限为： [-rwxrwx---] 分数
则是：
owner = rwx = 4+2+1 = 7
group = rwx = 4+2+1 = 7
others= --- = 0+0+0 = 0
所以等一下我们设定权限的变更时，该文件的权限数字就是770 啦！变更权限的指令chmod 的语法是这样
的：
chmod [-R] xyz 文件或目录
选项与参数：
xyz : 就是刚刚提到的数字类型的权限属性，为 rwx 属性数值的相加。
-R : 进行递归(recursive)的持续变更，亦即连同次目录下的所有文件都会变更
'
#举例来说，如果要将.bashrc 这个文件所有的权限都设定启用，那么就下达：
#[root@study ~]# ls -al .bashrc
#-rw-r--r--. 1 root root 176 Dec 29 2013 .bashrc
#[root@study ~]# chmod 777 .bashrc
#[root@study ~]# ls -al .bashrc
#-rwxrwxrwx. 1 root root 176 Dec 29 2013 .bashrc
#那如果要将权限变成『-rwxr-xr-- 』呢？那么权限的分数就成为 [4+2+1][4+0+1][4+0+0]=754 啰！所以你需
#要下达『chmod 754 filename』。另外，在实际的系统运作中最常发生的一个问题就是，常常我们以vim
#编辑一个shell 的文字批处理文件后，他的权限通常是-rw-rw-r-- 也就是 664， 如果要将该文件变成可执行
#文件，并且不要让其他人修改此一文件的话， 那么就需要-rwxr-xr-x 这样的权限，此时就得要下达：『chmod
#755 test.sh 』的指令啰！
#另外，如果有些文件你不希望被其他人看到，那么应该将文件的权限设定为例如：『-rwxr-----』，那就下达
#『chmod 740 filename 』吧！
#例题：
#将刚刚你的.bashrc 这个文件的权限修改回-rw-r--r--的情况吧！
#答：
#-rw-r--r--的分数是644，所以指令为：
#chmod 644 .bashrc

: '
符号类型改变文件权限
还有一个改变权限的方法呦！从之前的介绍中我们可以发现，基本上就九个权限分别是(1)user (2)group
(3)others 三种身份啦！那么我们就可以藉由u, g, o 来代表三种身份的权限！此外， a 则代表all 亦即全部
的身份！那么读写的权限就可以写成r, w, x 啰！也就是可以使用底下的方式来看：
chmod
u
g
o
a
+(加入)
-(除去)
=(设定)
r
w
x
文件或目录
'
#来实作一下吧！假如我们要『设定』一个文件的权限成为『-rwxr-xr-x』时，基本上就是：
#o user (u)：具有可读、可写、可执行的权限；
#o group 与others (g/o)：具有可读与执行的权限。
#所以就是：
#[root@study ~]# chmod u=rwx,go=rx .bashrc
## 注意喔！那个 u=rwx,go=rx 是连在一起的，中间并没有任何空格符！
#[root@study ~]# ls -al .bashrc
#-rwxr-xr-x. 1 root root 176 Dec 29 2013 .bashrc
#那么假如是『-rwxr-xr-- 』这样的权限呢？可以使用『chmod u=rwx,g=rx,o=r filename 』来设定。此外，如
#果我不知道原先的文件属性，而我只想要增加.bashrc 这个文件的每个人均可写入的权限， 那么我就可以使
#用：
#[root@study ~]# ls -al .bashrc
#-rwxr-xr-x. 1 root root 176 Dec 29 2013 .bashrc
#[root@study ~]# chmod a+w .bashrc
#[root@study ~]# ls -al .bashrc
#-rwxrwxrwx. 1 root root 176 Dec 29 2013 .bashrc
#而如果是要将权限去掉而不更动其他已存在的权限呢？例如要拿掉全部人的可执行权限，则：
#[root@study ~]# chmod a-x .bashrc
#[root@study ~]# ls -al .bashrc
#-rw-rw-rw-. 1 root root 176 Dec 29 2013 .bashrc
#[root@study ~]# chmod 644 .bashrc # 测试完毕得要改回来喔！
#知道+, -, = 的不同点了吗？对啦！+ 与– 的状态下，只要是没有指定到的项目，则该权限『不会被变动』，
#例如上面的例子中，由于仅以– 拿掉 x 则其他两个保持当时的值不变！多多实作一下，你就会知道如何
#改变权限啰！ 这在某些情况底下很好用的～举例来说，你想要教一个朋友如何让一个程序可以拥有执行的
#权限， 但你又不知道该文件原本的权限为何，此时，利用『chmod a+x filename』，就可以让该程序拥有
#执行的权限了。是否很方便？
