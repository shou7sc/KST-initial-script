#!/bin/bash

##########################################################
#
#  variable
#
##########################################################

proc1=mysqld
proc2=nginx
proc3="isuda.ru"
proc4="isutar.ru"

##########################################################

echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "1.  ユーザの確認......."
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
w
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "2.  動作しているプロセスの確認......."
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
ps auxfwww
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "3.現状の負荷を確認します........"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
vmstat 1 5
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "4.コネクションを確認します........"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
netstat -natpu 
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "5.firewalld or iptablesが有効か確認します ......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
firewall-cmd --state
iptables -nvL
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "6.cpuコア数 ......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
cat /proc/cpuinfo
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "6.メモリ使用量 ......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
echo "                                                                        "
echo "KB表示                                                                  "
echo "                                                                        "
free 
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "MB表示                                                                 "
free  -m 
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "7. $proc1 メモリ使用量......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
echo "                                                                        "
echo "KB表示                                                                 "
echo "                                                                        "
ps auxfwww | grep $proc1|grep -v "grep"| awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps |sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "MB表示                                                                  "
echo "                                                                        "
i=`ps auxfwww | grep $proc1 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| cut -d: -f6 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※1プロセスあたり" &&
i=`ps auxfwww | grep $proc1 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'|awk '{print $4}' |cut -d: -f2 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※TOTAL"
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "8. $proc2 メモリ使用量......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
echo "                                                                        "
echo "KB表示                                                                 "
echo "                                                                        "
ps auxfwww | grep $proc2|grep -v "grep"| awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "MB表示                                                                  "
echo "                                                                        "
i=`ps auxfwww | grep $proc2 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| cut -d: -f6 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※1プロセスあたり" &&
i=`ps auxfwww | grep $proc2 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| awk '{print $4}' |cut -d: -f2 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※TOTAL"
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "9. $proc3 メモリ使用量......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
echo "                                                                        "
echo "KB表示                                                                 "
echo "                                                                        "
ps auxfwww | grep $proc3|grep -v "grep"| awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}' 
echo "------------------------------------------------------------------------"; sleep 2
echo "                                                                        "
echo "MB表示                                                                  "
echo "                                                                        "
i=`ps auxfwww | grep $proc3 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| cut -d: -f6 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※1プロセスあたり" &&

i=`ps auxfwww | grep $proc3 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| awk '{print $4}' |cut -d: -f2 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※TOTAL"
echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "10. $proc4 メモリ使用量......"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 2
echo "                                                                        "
echo "KB表示                                                                 "
echo "                                                                        "
ps auxfwww | grep $proc4|grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'
echo "------------------------------------------------------------------------"; sleep 2
echo "                                                                        "
echo "MB表示                                                                      " 
echo "                                                                        "
i=`ps auxfwww | grep $proc4 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| cut -d: -f6 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※1プロセスあたり" &&
i=`ps auxfwww | grep $proc4 |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'| awk '{print $4}' |cut -d: -f2 ` ; x=`echo "scale=4; $i / 1000" | bc` ; echo "$x MB ※TOTAL"
