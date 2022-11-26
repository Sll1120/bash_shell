#!/bin/sh
#
# System-specific script to configure the DHCP client, server, and Wi-Fi
# module.  This script is invoked by the Ayla cond daemon when transitioning
# between varioius modes of operation.
# 
# Note: This is a sample script written for a system using wpa_supplicant and
# hostapd and may need to be modified or rewritten to provide the desired
# functionality for the target platform.
#

check_daemon_running() {
	local name="$1"
	local pid=0
	pid=$(pidof $name)
#	if [ -f /var/run/$name.pid ]; then
#		pid=$(cat /var/run/$name.pid)
#	elif [ -f /var/run/$name/$name.pid ]; then
#		pid=$(cat /var/run/$name/$name.pid)
#	fi
	if [ -z "$pid" ]; then
		pid=0
	fi
	if [ $pid -gt 0 ]; then
		kill -0 $pid 2>/dev/null
		if [ $? -eq 0 ]; then
			return 1
		fi
	fi
	return 0
}

start_daemon() {
	local name="$1"
	check_daemon_running $name
	if [ $? -ne 0 ]; then
		echo "start_daemon: $name already started"
		return 0
	fi
	echo "start_daemon: starting $name..."
	/etc/init.d/$name start
	return $?
}

stop_daemon() {
	local name="$1"
	check_daemon_running $name
	if [ $? -eq 0 ]; then
		echo "stop_daemon: $name already stopped"
		return 0
	fi
	echo "stop_daemon: stopping $name..."
	/etc/init.d/$name stop
	return $?
}



start_dns_client() {
	local name="$1"
	check_daemon_running $name
	#kill anyway
	kill -9 $(pidof $name)
	#if [ $? -ne 0 ]; then
	#	echo "start_daemon: $name already started"
	#	return 0
	#fi
	echo "start_daemon: starting $name..."
	/sbin/$name  -i wlan0 -b 
	return $?
}

stop_dns_client() {
	local name="$1"
	check_daemon_running $name
	if [ $? -eq 0 ]; then
		echo "stop_daemon: $name already stopped"
		return 0
	fi
	echo "stop_daemon: stopping $name..."
	kill -15 $(pidof "$name")
	return $?
}



print_usage() {
	echo "usage: $0 <module> <action> [interface] [IP addr]|[SSID] [channel] [security] [key]" >&2
	exit 1
}

if [ $# -lt 2 ]; then
	echo "incorrect arguments" >&2
	print_usage
fi

module="$1"
action="$2"
interface="$3"
ip_address="$4"
ssid="$4"
channel="$5"
security="$6"
key="$7"

case $module-$action in
	station-start)
		echo "-------$0: station start"
		ifconfig lo up
		ifconfig wlan0 0.0.0.0 0.0.0.0
		# Using wpa_supplicant, so nothing to do here
	;;
	station-stop)
		echo "-------$0: station stop"
		# Using wpa_supplicant, so nothing to do here
	;;
	station-scan)
		echo "-------$0: station scan"
		# Using wpa_supplicant, so nothing to do here
	;;
	station-connect)
		echo "-------$0: station connect"
		# Using wpa_supplicant, so nothing to do here
		ifconfig lo up
	;;
	station-disconnect)
		echo "-------$0: station disconnect"
		# Using wpa_supplicant, so nothing to do here
	;;
	ap-start)
		echo "-------$0: AP start"
		# Using hostapd, so nothing to do here
	;;
	ap-stop)
		echo "-------$0: AP stop"
		# Using hostapd, so nothing to do here
	;;
	dhcp-client-start)
		echo "-------$0: DHCP client start"
		#start_daemon "dhcpcd" # Ensure DHCP client is running
		start_dns_client "udhcpc"
	;;
	dhcp-client-stop)
		echo "-------$0: DHCP client stop"
		# Allow DHCP client to remain enabled for other interfaces
		stop_dns_client "udhcpc"
	;;
	dhcp-server-start)
		echo "-------$0: DHCP server start"
		#ifconfig $interface netmask 255.255.255.240 $ip_address
		ifconfig $interface $ip_address netmask 255.255.255.0 up
		start_daemon "dnsmasq"
	;;
	dhcp-server-stop)
		echo "-------$0: DHCP server stop"
		stop_daemon "dnsmasq"
		ifconfig $interface 0.0.0.0
	;;
	*)
		echo "-------$0: invalid command: $module-$action" >&2
		print_usage
	;;
esac

exit 0
