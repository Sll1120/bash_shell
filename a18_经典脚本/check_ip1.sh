#!/bin/bash
#by suliangliang on 2022-08-20
#Remark:
function check_ip() {
	IP=$1
	VALID_CHECK=$(echo $IP | awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
	if echo $IP | grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
		if [[ ${VALID_CHECK} == "yes" ]]; then
			echo "$IP available."
		else
			echo "$IP unavailable!"
		fi
	else
		echo "Format error!"
	fi
}
check_ip 192.168.1.1
check_ip 256.1.1.1
