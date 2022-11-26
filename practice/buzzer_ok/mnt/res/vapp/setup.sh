#!/bin/sh
chmod +x /mnt/res/vapp/acgi
chmod +x /mnt/res/vapp/acli
chmod +x /mnt/res/vapp/appd
chmod +x /mnt/res/vapp/cond
chmod +x /mnt/res/vapp/devd
chmod +x /mnt/res/vapp/devdwatch
chmod +x /mnt/res/vapp/gw_setup_agent
chmod +x /mnt/res/vapp/logd
chmod +x /mnt/res/vapp/mosquitto
chmod +x /mnt/res/vapp/mosquitto_pub
chmod +x /mnt/res/vapp/mosquitto_sub
chmod +x /mnt/res/vapp/ota_update
chmod +x /mnt/res/vapp/wifi_control.sh
chmod +x /mnt/res/vapp/start_ap.sh
chmod +x /mnt/res/vapp/www/lighttpd
#chmod +x /mnt/udisk/boot/BootAuto.sh
#.json files
echo a>/mnt/res/vapp/www/config.json
echo a>/mnt/res/vapp/www/getdsns.json
echo a>/mnt/res/vapp/www/lanip.json
echo a>/mnt/res/vapp/www/lanota.json
echo a>/mnt/res/vapp/www/local_reg.json
echo a>/mnt/res/vapp/www/logclient.json
echo a>/mnt/res/vapp/www/log_mods.json
echo a>/mnt/res/vapp/www/ota.json
echo a>/mnt/res/vapp/www/property.json
echo a>/mnt/res/vapp/www/push_button_reg.json
echo a>/mnt/res/vapp/www/registration.json
echo a>/mnt/res/vapp/www/regtoken.json
echo a>/mnt/res/vapp/www/reset.json
echo a>/mnt/res/vapp/www/status.json
echo a>/mnt/res/vapp/www/time.json
echo a>/mnt/res/vapp/www/wifi_connect.json
echo a>/mnt/res/vapp/www/wifi_profile.json
echo a>/mnt/res/vapp/www/wifi_profiles.json
echo a>/mnt/res/vapp/www/wifi_scan.json
echo a>/mnt/res/vapp/www/wifi_scan_results.json
echo a>/mnt/res/vapp/www/wifi_status.json
echo a>/mnt/res/vapp/www/wifi_stop_ap.json
echo a>/mnt/res/vapp/www/wps_pbc.json