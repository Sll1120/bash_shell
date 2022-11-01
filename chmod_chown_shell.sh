#!/bin/bash
#======================================
# File name:chmod_chown.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 01:42
#======================================
chmod -R u+rwx *.sh */*.sh
chmod u+rwx */ 
chmod g-wx *.sh && chmod g+r *.sh
chmod -R g-wx */*.sh && chmod g+r */*.sh
chmod g-wx */ 
chmod o-wx *.sh && chmod o+r *.sh
chmod -R o-wx */*.sh && chmod o+r */*.sh
chmod o-wx */ 
chown -R sll:sll *.sh */*.sh
chown sll:sll */  
