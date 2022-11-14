#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-14 23:07
# * Filename : 01改变所属群组_chgrp.sh
# **********************************************************
: '
chgrp ：改变文件所属群组
chown ：改变文件拥有者
chmod ：改变文件的权限, SUID, SGID, SBIT 等等的特性

改变所属群组, chgrp
chgrp [-R] dirname/filename ...
选项与参数：
-R : 进行递归(recursive)的持续变更，亦即连同次目录下的所有文件、目录
都更新成为这个群组之意。常常用在变更某一目录内所有的文件之情况。
'
#范例：
chgrp -R sll initial-setup-ks.cfg
chgrp testing initial-setup-ks.cfg
#chgrp: invalid group: `testing' <== 发生错误讯息啰～找不到这个群组名～
