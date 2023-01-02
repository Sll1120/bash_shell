#!/bin/sh
touch /mnt/udisk/support_robopad
iptables -F INPUT
unzip -o /mnt/udisk/www.zip -d /mnt/udisk/
chmod +x /mnt/udisk/www/*
sync
rm -rf /mnt/udisk/www.zip
sync
