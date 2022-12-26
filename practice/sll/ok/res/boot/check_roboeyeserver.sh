#!/bin/sh 

while [ 1 ] ; 
do
    busybox killall -0 Roboeye_server
    if [ $? = 1 ];
	then
		exec /mnt/res/app/Roboeye_server &
	fi  
	sleep 10
done
