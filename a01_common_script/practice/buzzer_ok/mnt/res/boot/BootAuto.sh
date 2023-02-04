#!/bin/sh
#Shark BootAuto
# keep 8M free memory
echo 8192 > /proc/sys/vm/min_free_kbytes
export LD_LIBRARY_PATH=/mnt/res/app

ULBrainL01_v3_PATH="/mnt/res"
ULBrainL01_UDISK_PATH="/mnt/udisk"
DEFAULT_APP_PATH_V3="/usr/local/qfeel_app"

DEFAULT_UDISK_CONFIG_PATH="/mnt/udisk/qfeel"
sleep 1
upgrade_flag="0"

chmod 777 $ULBrainL01_v3_PATH/boot/wifi_set_channel_plan.sh
$ULBrainL01_v3_PATH/boot/wifi_set_channel_plan.sh &

##delete carto replay bag but no folder
carto_reply_dir=/mnt/udisk/data
lists=`ls -t $carto_reply_dir`
a=1
for i in $lists
do
	if [ $a -gt 3 ]; then
		echo "rm $carto_reply_dir/$i"
		rm -f $carto_reply_dir/$i
	fi
	let a++
done
sync


if [[ -f /mnt/udisk/ota/ota_start.flag ]] && [[ ! -f /mnt/udisk/ota/ota_finish.flag ]]; then
    echo "Ready to ota" >> /mnt/udisk/ota/upgrade.log
    if [[ ! -f /mnt/udisk/ota/ota_md5_error.flag]]; then
        echo "There is some error happens!"
    else
        if [ -f /mnt/udisk/ota/upgrade/upgrade.sh ];then
            chmod +x /mnt/udisk/ota/upgrade/upgrade.sh && /mnt/udisk/ota/upgrade/upgrade.sh
            upgrade_flag="1"
            echo "go to reboot!! $upgrade_flag" >> /mnt/udisk/ota/upgrade.log
        else
            echo "Can not find the upgrade.sh, start normally!" >> /mnt/udisk/ota/upgrade.log
        fi
    fi
else
    debugsh_path='/mnt/udisk/debug_sh_folder'
    if [ ! -d  $debugsh_path ]; then
        mkdir -p $debugsh_path
    fi
    for sh_file in $( ls $debugsh_path/*.sh )
    do
        chmod +x $sh_file;
        $sh_file &
    done
fi

if [ -e /usr/local/ConfBackup.sh ]; then
	chmod +x /usr/local/ConfBackup.sh
	/usr/local/ConfBackup.sh -r > /tmp/file_restore.log
	sync
fi

# run from res
if [ -f $ULBrainL01_v3_PATH/boot/BootAuto.sh ] && [ $upgrade_flag -eq "0" ]; then
	echo "<Roboeye_server path>: path:\"/mnt/res/app\""
	chmod 777 $ULBrainL01_v3_PATH/boot/sta_wifi.sh 
	#$ULBrainL01_v3_PATH/boot/sta_wifi.sh &
    if [ -f $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh ]; then
	    chmod 777 $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh
        #$ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh &
    fi


	
	if [ -e /mnt/udisk/support_robopad ]; then
		if [ -e /mnt/udisk/www/robopad_rvc ]; then
			chmod +x /mnt/udisk/www/robopad_rvc
			/mnt/udisk/www/robopad_rvc > /dev/null &
		fi
		chmod +x /mnt/udisk/enable_robopad.sh
		/mnt/udisk/enable_robopad.sh
	else
		chmod +x /mnt/udisk/disable_robopad.sh
		/mnt/udisk/disable_robopad.sh
	fi


        if [ -e /mnt/res/vapp/start_ap.sh ]; then
            chmod 777 /mnt/res/www/lighttpd
            chmod 777 /mnt/res/vapp/*

            sed -i 's/disable_qfeel_net = false/disable_qfeel_net = true/g;
            s/disable_controller = \[ 5,15 \]/disable_controller = \[ 5,9 \]/' /mnt/res/app/config_file.conf

            sed -i 's/disable_qfeel_net = false/disable_qfeel_net = true/g;
            s/disable_controller = \[ 5,15 \]/disable_controller = \[ 5,9 \]/' /mnt/res/app/ValleyIR_patch.conf

            chmod 777 /mnt/res/vapp/start_ap.sh
            exec /mnt/res/vapp/start_ap.sh &

        else
            sed -i 's/disable_qfeel_net = true/disable_qfeel_net = false/g;
            s/disable_controller = \[ 5,9 \]/disable_controller = \[ 5,15 \]/' /mnt/res/app/config_file.conf

            sed -i 's/disable_qfeel_net = true/disable_qfeel_net = false/g;
            s/disable_controller = \[ 5,9 \]/disable_controller = \[ 5,15 \]/' /mnt/res/app/ValleyIR_patch.conf
            #It open only when use QFT APP
            chmod 777 $ULBrainL01_v3_PATH/boot/wlan_serverd
            $ULBrainL01_v3_PATH/boot/wlan_serverd   > /tmp/wland.log &
        fi

	chmod 777 $ULBrainL01_v3_PATH/app/preUpgrade.sh
	chmod 777 $ULBrainL01_v3_PATH/app/Roboeye_server

	if [ -f  $ULBrainL01_v3_PATH/app/QOSCore ]; then
	  chmod +x  $ULBrainL01_v3_PATH/app/QOSCore
	  $ULBrainL01_v3_PATH/app/QOSCore 2>&1 > /tmp/qoscore.log &
	  sleep 1
	fi

	if [ -f $ULBrainL01_UDISK_PATH/qostools/LidarDataRecorder ]; then
		chmod +x $ULBrainL01_UDISK_PATH/qostools/LidarDataRecorder
		##open LidarDataRecorder if need record data. default close
		#$ULBrainL01_UDISK_PATH/qostools/LidarDataRecorder > /dev/null &
	fi

	if [ -f $ULBrainL01_UDISK_PATH/Carto ]; then
	  chmod 777 $ULBrainL01_UDISK_PATH/Carto
	  $ULBrainL01_UDISK_PATH/Carto 2>&1 >> /tmp/carto.log &
	fi

	if [ -f $ULBrainL01_v3_PATH/boot/autorun.sh ]; then
		chmod +x $ULBrainL01_v3_PATH/boot/autorun.sh
		$ULBrainL01_v3_PATH/boot/autorun.sh &
	fi

	#start Roboeye_server have two methods.
	# 1. $ULBrainL01_v3_PATH/app/Roboeye_server,	this way if Roboeye_server is down,the process over.
	# 2. $ULBrainL01_v3_PATH/boot/check_roboeyeserver.sh &,	this way if Roboeye_server is down,Roboeye_server can restart automatically.

 	chmod +x $ULBrainL01_v3_PATH/app/L01Daemon
    $ULBrainL01_v3_PATH/app/L01Daemon 90
 	if [ -f $ULBrainL01_v3_PATH/app/logFilter ];then
         chmod 777 $ULBrainL01_v3_PATH/app/logFilter
 	     $ULBrainL01_v3_PATH/app/Roboeye_server |  $ULBrainL01_v3_PATH/app/logFilter
 	else
 	     $ULBrainL01_v3_PATH/app/Roboeye_server  > /dev/null
 	fi
	#chmod 777 $ULBrainL01_v3_PATH/boot/check_roboeyeserver.sh
	#$ULBrainL01_v3_PATH/boot/check_roboeyeserver.sh


#run from nor flash
elif [ $upgrade_flag -eq "0" ]; then
	echo "<Roboeye_server path>: path:\"/usr/local/qfeel_app\""
	#check sta_wifi.sh
	if [ -f $ULBrainL01_v3_PATH/boot/sta_wifi.sh ]; then
		echo "sta_wifi.sh run from $ULBrainL01_v3_PATH/boot"
		chmod 777 $ULBrainL01_v3_PATH/boot/sta_wifi.sh
	    $ULBrainL01_v3_PATH/boot/sta_wifi.sh &
	else
		echo "sta_wifi.sh run from $DEFAULT_APP_PATH_V3"
		cp $DEFAULT_APP_PATH_V3/boot/sta_wifi.sh  $ULBrainL01_v3_PATH/boot
		chmod 777 $ULBrainL01_v3_PATH/boot/sta_wifi.sh
	    $DEFAULT_APP_PATH_V3/boot/sta_wifi.sh &		
	fi
	#check config_file.conf
	if [ -f $ULBrainL01_v3_PATH/app/config_file.conf ];then
		echo "config_file.conf run from $ULBrainL01_v3_PATH/app"		
	else
		echo "config_file.conf run from $DEFAULT_APP_PATH_V3"
		cp $DEFAULT_APP_PATH_V3/app/config_file.conf $ULBrainL01_v3_PATH/app
	fi
	#check sta_RunTest_wifi.sh
        if [ -f $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh ]; then
            echo "sta_RunTest_wifi.sh run from $ULBrainL01_v3_PATH/boot"
            chmod 777 $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh
            $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh &
        else
            echo "sta_RunTest_wifi.sh run from $DEFAULT_APP_PATH_V3"
            cp $DEFAULT_APP_PATH_V3/boot/sta_RunTest_wifi.sh  $ULBrainL01_v3_PATH/boot
            chmod 777 $ULBrainL01_v3_PATH/boot/sta_RunTest_wifi.sh
            $DEFAULT_APP_PATH_V3/boot/sta_RunTest_wifi.sh &
        fi

	#huqr add 20171027
        $DEFAULT_APP_PATH_V3/app/Roboeye_server

elif [ $upgrade_flag -eq "1" ]; then
    echo "Comes from upgrade, do nothing" >> /mnt/udisk/ota/upgrade.log
fi
#This sentence is a check info, never change it
#This sentence is a check info, never change it
#This sentence is a check info, never change it



