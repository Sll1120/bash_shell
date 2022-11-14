#!/sll/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-14 23:15
# * Filename : 02改变文件拥有者_chown.sh
# **********************************************************
: 'chown [-R] 账号名称 文件或目录
chown [-R] 账号名称:组名 文件或目录
选项与参数：
-R : 进行递归(recursive)的持续变更，亦即连同次目录下的所有文件都变更
'
#范例：将 initial-setup-ks.cfg 的拥有者改为sll 这个账号：
chown sll initial-setup-ks.cfg
ls -l
#范例：将 initial-setup-ks.cfg 的拥有者与群组改回为root：
chown root:root initial-setup-ks.cfg
