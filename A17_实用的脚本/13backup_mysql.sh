#!/bin/bash
#======================================
# File name:shell_13backup_mysql.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 14:20
#======================================
#!/bin/sh
source /etc/profile
dbName=mysql
tableName=db
echo "`date +'%Y-%m-%d %H:%M:%S'` , start loading data..."
mysql -uroot -proot -P3306 ${dbName} -e "LOAD DATA LOCAL INFILE '# /home/wenmin/wenxing.txt' INTO TABLE ${tableName} FIELDS TERMINATED BY ';'"
echo "`date +'%Y-%m-%d %H:%M:%S'` , start loading data..."
exit
EOF
