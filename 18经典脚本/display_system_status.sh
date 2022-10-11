#! /bin/bash
printf "Memory\tDisk\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
sleep 5
done
