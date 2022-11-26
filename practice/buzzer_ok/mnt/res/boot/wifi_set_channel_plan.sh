#!/bin/sh

#read wifi channel plan value
WIFI_CHANNEL_PLAN=0x00		#default region is US 
WIFI_CONFIG_PATH="/mnt/res/app/wifi_channel_plan.config"
WIFI_DIVER_PATH="/usr/local/8188fu.ko"

get_wifi_channel_plan()
{
	local channel=`cat ${WIFI_CONFIG_PATH} | grep "WIFI_CHANNEL_PLAN="`
	local channel_hex=${channel#*WIFI_CHANNEL_PLAN=}

	#channel_hex is not  hex number ?
	echo $channel_hex | grep -q '0[xX][0-9a-fA-F][0-9a-fA-F]'
	[ $? -ne 0 ] && echo "${channel_hex} is not  hex number" && return

	local channel_decimal=`printf %d ${channel#*WIFI_CHANNEL_PLAN=}` 
	#echo "channel_decimal= ${channel_decimal}"

	[[ ${#channel_hex} -eq 4 && ${channel_decimal} -ge 0 && ${channel_decimal} -lt 255 ]] && WIFI_CHANNEL_PLAN=${channel_hex}
	
	echo "WIFI_CHANNEL_PLAN=${WIFI_CHANNEL_PLAN}" 
}	

 [[ -e ${WIFI_CONFIG_PATH} && -s ${WIFI_CONFIG_PATH} ]] && get_wifi_channel_plan
 [ -e ${WIFI_DIVER_PATH} ] && insmod ${WIFI_DIVER_PATH} rtw_channel_plan=${WIFI_CHANNEL_PLAN}

