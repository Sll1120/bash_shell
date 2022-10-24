#!/bin/bash
#======================================
# File name:chmod_chown.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 01:42
#======================================
chmod u+rwx *.sh */*.sh
chmod g-x *.sh && chmod g+r *.sh
chmod g-x */*.sh && chmod g+r */*.sh
chmod o-wx *.sh && chmod o+r *.sh
chmod o-wx */*.sh && chmod o+r */*.sh
chown sll:root *.sh && chown sll:root */*.sh
