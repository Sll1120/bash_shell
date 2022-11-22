#!/bin/bash
#======================================
# File name:shell_10case_eg.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-06 23:57
#======================================
#!/bin/bash
read -p "please input name:" name
read -p "please input sex(male|female):" sex
read -p "please input age:" age
case $sex in
    female)
    case $age in
        1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17)
        echo $name"gril, nice to meet you"
        ;;
        *)
        echo $name"lady, nice to meet you"
        ;;
     esac
     ;;
    male)
    case $age in
        1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17)
        echo $name" little boy, go home and study"
        ;;
        *)
        read -p $name" sir, Are you married?:" answer
        case $answer in
        Yes|married)
        echo "What do you want to do?"
        ;;
        No|not)
        read -p "Do you have a car and house?:" reply
         case $reply in
                Yes)
                echo "Let's get married. It's just the seventh day of today."
                 ;;
                No)
                 echo "sorry,I have something else to do..."
                 ;;
                 *)
                 echo "please answer this question"
                 ;;
                 esac
                 ;;
            *)
            echo "Are you married?"
             ;;
             esac
        ;;
        esac
        ;;
    *)
    echo "Are you from Thailand?"
    ;;
esac

