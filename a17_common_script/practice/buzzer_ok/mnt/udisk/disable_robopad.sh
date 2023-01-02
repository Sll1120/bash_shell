#!/bin/sh
rm -f /mnt/udisk/support_robopad
sync
iptables -F INPUT
iptables -I INPUT -p tcp --dport 8080 -j DROP
iptables -I INPUT -p tcp --dport 9006 -j DROP
sync
