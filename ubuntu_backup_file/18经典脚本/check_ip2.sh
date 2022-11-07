#!/bin/bash
#by suliangliang on 2022-08-20
#Remark:
#!/bin/bash
function check_ip() {
	IP=$1
	if [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		FIELD1=$(echo $IP | cut -d. -f1)
		FIELD2=$(echo $IP | cut -d. -f2)
		FIELD3=$(echo $IP | cut -d. -f3)
		FIELD4=$(echo $IP | cut -d. -f4)
		if [ $FIELD1 -le 255 -a $FIELD2 -le 255 -a $FIELD3 -le 255 -a $FIELD4 -le 255 ]; then
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
