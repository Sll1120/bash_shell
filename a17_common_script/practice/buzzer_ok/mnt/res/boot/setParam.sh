#!/bin/sh
if [ $# -ne 3 ];
then
    echo "params should be 3"
    return;
fi
filename=$1;
paramname=$2;
paramval=$3;

mount -o remount,rw -t ext4 /dev/block/by-name/sys /mnt/sys
if [ ! -f ${filename} ];
then
    touch ${filename}
fi

grep "${paramname}" ${filename};
if [ $? -eq 0 ] ; then 
    sed -i "/${paramname}/c\\${paramname} = ${paramval}"  ${filename}; 
else 
    echo "${paramname} = ${paramval}" >> ${filename};
fi;
mount -o remount,ro -t ext4 /dev/block/by-name/sys /mnt/sys
sync
