#!/bin/sh
while true ; do
date +"%H:%M:%S"
ps auxfwww | grep mysql |grep -v "grep" |awk '{print $2}' |xargs -I@@ egrep -H '^Rss|^Shared' /proc/@@/smaps|sed 's/:/ /'|awk '/Rss/{f[$1]++;rs+=$3}/Shared/{ss+=$3}END{c=0;for(e in f){c++};sa=ss/c;t=rs-ss+sa;printf("procs:%d\trss:%d\tshared:%d\ttotal:%d\tavg:%d\n",c,rs,sa,t,t/c)}'
sleep 1

done
