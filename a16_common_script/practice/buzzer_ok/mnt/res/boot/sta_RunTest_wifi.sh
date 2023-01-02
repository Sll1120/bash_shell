#!/bin/sh

echo "this is RunTest wifi shell !"
killall -9 devd
killall -9 appd
killall -9 cond
killall -9 dnsmasq
killall -9 hostapd
sync

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

wpa_supplicant -Dnl80211 -c /tmp/wpa_supplicant.config -iwlan0 -B
#touch /tmp/acconf_is_ok.flag

if [ -f /mnt/res/vapp/AC.conf ]; then
    grep -E "AC000W007209763|AC000W010663534|AC000W019923230|AC000W007209816" /mnt/res/vapp/AC.conf
    if [ $? -ne 0 ]; then
        touch /tmp/acconf_is_ok.flag
        sync
    fi
fi
