#!/bin/bash
# by author suliangliangi on 2022-8-1
# check http server start|stop|starus
echo -e ""
PS3="Select a number:"
select num in start stop status quit
do
	case $num in 
start)
    systemctl start httpd && echo "httpd服务已经开启" || echo "开启失败"
;;
stop)
    systemctl stop httpd && echo "httpd服务已经关闭" || echo "关闭失败"
;;
restart)
    systemctl restart httpd && echo "httpd服务已经重启" || echo "重启失败"
;;
status)
    systemctl status httpd && echo -e " httpd 的服务状态"
;;
quit)
	exit
esac
done
