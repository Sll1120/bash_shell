#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-26 16:33
# * Filename : 15backup_log.sh
# **********************************************************
# For details see man 4 crontabs
# Example of job definition:
# .---------------- minute (0 - 59)
# | .------------- hour (0 - 23)
# | | .---------- day of month (1 - 31)
# | | | .------- month (1 - 12) OR jan,feb,mar,apr ...
# | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# | | | | |
# * * * * * user-name command to be executed

# 每周 5 使用 tar 命令备份/var/log 下的所有日志文件
# 编写备份脚本,备份后的文件名包含日期标签,防止后面的备份将前面的备份数据覆盖
# 注意 date 命令需要使用反引号括起来,反引号在键盘<tab>键上面
sudo tar -zcvf log_`date +%Y%m%d`.tar.gz /var/log 
# crontab -e #编写计划任务，执行备份脚本
#*/2 * * * *   bash /home/sll/git/shell/a17_common_script/15backup_log.sh 
