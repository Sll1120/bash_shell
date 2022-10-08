#!/bin/bash
# by suliangliang on 2022-08-20
# Remark:
function check_ip(){
    local IP=$1
    VALID_CHECK=$(echo $IP|awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
    if echo $IP|grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$" >/dev/null; then
        if [[ ${VALID_CHECK} == "yes" ]]; then
            echo -e "\e[32m $IP available! \e[0m"
            return 0
        else
            echo -e "\e[31m $IP unavailable! \e[0m"
            return 1
        fi
    else
        echo "Format error! Please input again."
        return 1
    fi
}
while true; do
    read -p "Please enter IP: " IP
    check_ip $IP
    [ $? -eq 0 ] && break || continue
done 
