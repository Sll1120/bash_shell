#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 11:47
# * Filename : 04check_root.sh
# **********************************************************
#!/bin/bash
ROOT_UID=0
if [ "$UID" -eq "$ROOT_UID" ]; then
	echo "You are root."
else
	echo "你不是root"
fi
exit 0

