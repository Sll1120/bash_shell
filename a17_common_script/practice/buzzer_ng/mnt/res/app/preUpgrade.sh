#!/bin/sh

OTA_INFO_DIR=/mnt/udisk/ota
UDISK_TMP_DIR=/mnt/udisk/tmp

if [ -d ${UDISK_TMP_DIR} ]; then
    rm -rf ${UDISK_TMP_DIR}
    sync
    echo "removing tmp dir in udisk" >> ${OTA_INFO_DIR}/upgrade.log
fi

if [ ! -d ${OTA_INFO_DIR} ]; then
    mkdir -p ${OTA_INFO_DIR}
    echo "Creat the ota dir " >> ${OTA_INFO_DIR}/upgrade.log
else
    rm -rf ${OTA_INFO_DIR}
    mkdir -p  ${OTA_INFO_DIR}
fi
sync


if [ -f /tmp/upgrade.zip ];then
    echo "There is upgrade.zip file unzip it!" >> ${OTA_INFO_DIR}/upgrade.log
    unzip -d /mnt/udisk/ota/ /tmp/upgrade.zip
    if [ $? -eq 1 ]; then
        echo "Can not unzip upgrade.zip file" >> ${OTA_INFO_DIR}/upgrade.log
        touch ${OTA_INFO_DIR}/ota_nospace.flag
    else
        echo "unzip success!" >> ${OTA_INFO_DIR}/upgrade.log
    fi
    sync

    cd /mnt/udisk/ota/upgrade/
    busybox md5sum -c ./md5.txt
    if [ $? -eq 0 ];then
        echo "md5 check success! Permission to upgrade!" >> ${OTA_INFO_DIR}/upgrade.log
        touch ${OTA_INFO_DIR}/ota_start.flag
    else
        echo "md5 check failed! Permission denied!" >> ${OTA_INFO_DIR}/upgrade.log
        touch ${OTA_INFO_DIR}/ota_md5_error.flag
    fi
else
    echo "There is not upgrade.zip file, abort upgrade!" >> ${OTA_INFO_DIR}/upgrade.log
fi

#reboot anyway
touch /mnt/udisk/start_silence.flag
reboot


