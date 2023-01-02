#!/bin/sh 

echo "this is wifi shell !"
#echo 4       4       1      7 > /proc/sys/kernel/printk
#echo

insmod /usr/local/8188fu.ko
sleep 1s

#set wifi log_level
echo 0 > /proc/net/rtl8188fu/log_level

echo "ctrl_interface=/var/run/wpa_supplicant
ap_scan=1
network={
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP TKIP
	group=CCMP TKIP
	ssid=\"Qfeeltech\"
	psk=\"lianbushang\"
}" > /tmp/wpa_supplicant.config

ifconfig lo up
ifconfig wlan0 up

/usr/local/sbin/wpa_supplicant -Dnl80211 -c /tmp/wpa_supplicant.config -iwlan0 -B

udhcpc -i wlan0

#sleep 2s

#ifconfig wlan0 192.168.2.2
echo "-------ifconfig :"
ifconfig 

echo `date` 
