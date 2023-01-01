#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-01-01 11:56
# * Filename : 36从shell脚本发送邮件.sh
# **********************************************************
#收件箱
EMAIL_RECIVER="sll917@outlook.com"

#发送者邮箱
EMAIL_SENDER="sll917@qq.com"
#邮箱用户名
EMAIL_USERNAME="sll917"
#邮箱密码
#使用qq邮箱进行发送需要注意：首先需要开启：POP3/SMTP服务，其次发送邮件的密码需要使用在开启POP3/SMTP服务时候腾讯提供的第三方客户端登陆码。
EMAIL_PASSWORD=kyajdhtjeasubiha

#附件路径
FILE1_PATH="/home/sll/git/shell/a17_common_script/z_editors.txt"

#smtp服务器地址
EMAIL_SMTPHOST=smtp.qq.com

subject="Greetings"
message="Welcome to Ubuntu"

sendEmail -f ${EMAIL_SENDER} -t ${EMAIL_RECIVER} -s ${EMAIL_SMTPHOST} -u ${subject} -xu ${EMAIL_USERNAME} -xp ${EMAIL_PASSWORD} -m ${message} -a ${FILE1_PATH} -o message-charset=utf-8
