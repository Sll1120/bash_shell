#!/bin/bash
# **********************************************************
# * Author : liangliangSu
# * Email : sll917@hotmail.com
# * Create time : 2023-02-05 17:10
# * Filename : 批量检查URL状态.sh
# **********************************************************
[ -f /etc/init.d/functions ] && . /etc/init.d/functions

DATE=$(date +%Y-%m-%d-%H-%M-%S)
MAIL=$(which mail)
# mail name
NAME=(
sll917	
sll917
)

# check urls status
URLS=(
	http://192.168.99.233:9004/webfof_login/login
	http://www.aaca.com
)

# curl 获取状态码
curl_ip() {
	CURL=$(curl -o /dev/null -s --connect-timeout 5 -w '%{http_code}' $1 | egrep "200|302" | wc -l)
	return $CURL
}

# 邮件
mail() {
	for m in ${NAME[*]}; do
		echo "Retry curl $1 again is Failure,Please check url on $DATE" | $MAIL -s "Service state Warning" $m@outlook.com
	done
}

# 主程序
main() {
	for n in ${URLS[*]}; do
		curl_ip $n
		if [ $? -eq 1 ]; then
			action "curl $n" /bin/true
		else
			action "curl $n" /bin/false
			curl_ip $n
			sleep 5
			if [ $CURL -eq 1 ]; then
				action "Retry curl $n again" /bin/true
			else
				action "Retry curl $n again" /bin/false
				mail $n
			fi
		fi
	done
}
main

# crontab 添加定时任务5分钟执行一次。
# */5 * * * * /bin/bash /server/scripts/chk_url.sh &>/dev/null
#例如：将百度腾讯阿里网站URL，放置到属组array
array=(
	http://baidu.com
	http://qq.com
	http://taobao.com
)
# chmod +x chk_curl.sh
# sh chk_curl.sh
