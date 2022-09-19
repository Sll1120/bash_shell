#!/bin/bash
#by author sll on 2022-8-2
PS3="Please enter you select install menu:"
select i in http php mysql quit
do
case $i in
        http)
        echo -e "\033[31m Test Httpd \033[0m" 
        ;;
        php)
        echo  -e "\033[32m Test PHP\033[0m"
        ;;
        mysql)
        echo -e "\033[33m Test MySQL.\033[0m"
        ;;
        quit)
        echo -e "\033[35m The System exit.\033[0m"
        exit
esac
done
