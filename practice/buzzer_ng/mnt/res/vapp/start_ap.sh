#!/bin/sh
ducommand="busybox du"
#ducommand="du"
cpath="/mnt/res/vapp"
conf=$cpath/appd.conf
acOrign="$cpath/AC.conf"
acStartup=$acOrign.startup
acStartupBackup=$acStartup.backup
acDefault=$cpath/ACdefault.conf

check_file_empty() {
	local file="$1"
	filesize=$($ducommand $file)
	set -- $filesize
	size=$1
	size=$((size))
	#echo $size
	if [ $size -eq 0 ]; then
		return 1
	fi	
	return 0
}

#debug code!!!
kill $(pidof syslogd)

if [ -f /mnt/udisk/vota/scmupgrade.sh ];then
	touch /mnt/udisk/start_silence.flag
	sync
	chmod +x /mnt/udisk/vota/scmupgrade.sh && /mnt/udisk/vota/scmupgrade.sh
else
	echo "Start Normally"
fi

check_file_empty $conf
if [ $? -eq 1 ]; then
	rm $conf
	echo "Startup Patch applied"
	sync
else
	echo "appd OK"

fi
check_file_empty $acOrign
if [ $? -eq 1 ]; then
	check_file_empty $acStartup
	if [ $? -eq 1 ]; then
		check_file_empty $acStartupBackup
		if [ $? -eq 1 ]; then
			cp $acDefault $acOrign
			sync
			echo "DSN Set to default."
		fi
	fi
fi

echo 0 > /proc/1/net/rtl8189fs/log_level

echo "ctrl_interface=/var/run/wpa_supplicant
ap_scan=1
network={
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP TKIP
	group=CCMP TKIP
	ssid=\"_\"
	psk=\"_2^3n#knl2\"
}" > /tmp/wpa_supplicant.config

ifconfig lo up
ifconfig wlan0 up

export LD_LIBRARY_PATH=/mnt/res/vapp/lib:$LD_LIBRARY_PATH
export PATH="$PATH:/usr/local/sbin:/mnt/res/vapp/www:/mnt/res/vapp"
/mnt/res/vapp/mosquitto -c /mnt/res/vapp/mosquitto.conf -d 
kill -15 $(pidof udhcpc)
kill -15 $(pidof dnsmasq)
kill -15 $(pidof hostapd)
/mnt/res/vapp/logd
/mnt/res/vapp/www/lighttpd -f /mnt/res/vapp/www/lighttpd.conf -m /mnt/res/vapp/lib
sleep 1
/mnt/res/vapp/devd -c /mnt/res/vapp/AC.conf
/mnt/res/vapp/cond -c /mnt/res/vapp/cond.conf 