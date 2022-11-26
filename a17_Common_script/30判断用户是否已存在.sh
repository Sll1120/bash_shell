#!/bin/bash
# **********************************************************
# * Author : liangliangsu
# * Email : sll917@hotmail.com
# * Create time : 2022-10-09 15:57
# * Filename : shell_30判断用户是否已存在.sh
# **********************************************************
#!/bin/bash
function failure() {
    echo -e "\033[31m $1 \033[0m"       # red, failure
}

function success() {
    echo -e "\033[32m $1 \033[0m"        # green,success
}

function warning() {
    echo -e "\033[33m $1 \033[0m"       # yellow, warning
}

function check_username() {
  if [[ $(id -u "${USER_NAME}" 2> /dev/null) != "" ]]; then
    failure "您输入的用户已存在，该用户名不可用，请核对后重新输入！"   return 1
  else
    success "您输入需要创建的用户名为：${USER_NAME}"
    return 0
  fi
}

while true; do
    read -r -p " 请输入需要创建的用户名,输入后按Enter继续:" USER_NAME
      if [[ -z ${USER_NAME} ]]; then
        failure "您必须输入需要创建的用户名！"
        continue
  fi
    read -r -p "您输入用户名为:${USER_NAME},请输入[y/n]确认:" USER_NAME_Confirm
      if [[ ${USER_NAME_Confirm} == "y" ]]; then
        check_username "${USER_NAME}"
        [[ $? -eq 0 ]] && break || continue
  fi
done

