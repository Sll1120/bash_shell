#! /bin/sh
##this shell will auto execute when robot reboot.
##default do nothing

##monitor Roboeye_server starts
while true
do
	ps | grep Roboeye_server | grep -v "grep"
	if [ $? -eq 0 ]; then
		break
	fi
	sleep 1
done

sleep 5

if [ -e /mnt/udisk/autotest_dist/auto_start.sh ]; then
	chmod +x /mnt/udisk/autotest_dist/auto_start.sh
	/mnt/udisk/autotest_dist/auto_start.sh &
fi

##enable run_node.sh in below
#chmod +x /mnt/udisk/autotest_dist/bin/* && cd /mnt/udisk/autotest_dist/ && nohup ./bin/run_node.sh . &
