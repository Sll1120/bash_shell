#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2022-11-27 16:51
# * Filename : 29auto_backupMysql.sh
# **********************************************************
#Define PATH定义变量
BAKDIR=/data/backup/mysql/`date +%Y-%m-%d`
MYSQLDB=webapp
MYSQLUSR=backup
MYSQLPW=backup
#must use root user run scripts 必须使用root用户运行，$UID为系统变量
if [ $UID -ne 0 ];then
      echo -e "This script must use the root user !"
      sleep 2
      exit 0
fi
#Define DIR and mkdir DIR 判断目录是否存在，不存在则新建
if [ ! -d $BAKDIR ];then
	mkdir -p $BAKDIR
else
	echo This is $BAKDIR exists.... 
fi
#Use mysqldump backup mysql 使用mysqldump备份数据库
/usr/bin/mysqldump -u$MYSQLUSR -p$MYSQLPW -d $MYSQLDB > $BAKDIR/webapp_db.sql
echo "The mysql backup successfully "

#===========================================================
#source /etc/profile
#dbName=mysql
#tableName=db
#echo "`date +'%Y-%m-%d %H:%M:%S'` , start loading data..."
#mysql -uroot -proot -P3306 ${dbName} -e "LOAD DATA LOCAL INFILE '# /home/wenmin/wenxing.txt' INTO TABLE ${tableName} FIELDS TERMINATED BY ';'"
#echo "`date +'%Y-%m-%d %H:%M:%S'` , start loading data..."
#exit
#EOF
