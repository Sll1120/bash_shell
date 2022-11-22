#!/bin/bash
#======================================
# File name:shell_24tomcat_restart.sh
# Author:liangliangSu
# Email:sll917@hotmail.com
# Date of writing:2022-10-07 19:11
#======================================
# 获取tomcat PPID  
TomcatID=$(ps -ef |grep tomcat |grep -w 'apache-tomcat-7.0.75'|grep -v 'grep'|awk '{print $2}')  

# tomcat_startup  
StartTomcat=/opt/apache-tomcat-7.0.75/bin/startup.sh  


#TomcatCache=/usr/apache-tomcat-5.5.23/work  

# 定义要监控的页面地址  
WebUrl=http://192.168.254.118:8080/

# 日志输出  
GetPageInfo=/dev/null  
TomcatMonitorLog=/tmp/TomcatMonitor.log  

Monitor()  
  {  
   echo "[info]开始监控tomcat...[$(date +'%F %H:%M:%S')]"  
   if [ $TomcatID ]
 then  
      echo "[info]tomcat进程ID为:$TomcatID."  
      # 获取返回状态码  
      TomcatServiceCode=$(curl -s -o $GetPageInfo -m 10 --connect-timeout 10 $WebUrl -w %{http_code})  
      if [ $TomcatServiceCode -eq 200 ];then  
          echo "[info]返回码为$TomcatServiceCode,tomcat启动成功,页面正常."  
      else  
          echo "[error]访问出错，状态码为$TomcatServiceCode,错误日志已输出到$GetPageInfo"  
          echo "[error]开始重启tomcat"  
          kill -9 $TomcatID  # 杀掉原tomcat进程  
          sleep 3  
          #rm -rf $TomcatCache # 清理tomcat缓存  
          $StartTomcat  
      fi  
      else  
      echo "[error]进程不存在!tomcat自动重启..."  
      echo "[info]$StartTomcat,请稍候......"  
      #rm -rf $TomcatCache  
      $StartTomcat  
    fi  
    echo "------------------------------"  
   }  
   Monitor>>$TomcatMonitorLog
