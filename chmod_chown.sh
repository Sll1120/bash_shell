#!/bin/bash
#======================================
# File name:chmod_chown.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 01:42
#======================================
chmod u+rwx *.sh */*.sh
chmod u+rwx */ 
chmod g-wx *.sh && chmod g+r *.sh
chmod g-wx */*.sh && chmod g+r */*.sh
chmod g-wx */ 
chmod o-wx *.sh && chmod o+r *.sh
chmod o-wx */*.sh && chmod o+r */*.sh
chmod o-wx */ 
chown sll:sll *.sh && chown sll:sll */*.sh
chown sll:sll */  
