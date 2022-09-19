#!/bin/bash
bash for2.sh
EXCODE=$?
if [ "$EXCODE" == "0" ]; then
echo "OK"
else echo "脚本运行有报错"
fi
