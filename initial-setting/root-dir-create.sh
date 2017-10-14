#!/bin/bash

if [ "`id | grep root`" = "" ]
then
    echo "root de execute sitene!"
    exit 1
fi

cd /root &&
mkdir analysis &&
cd analysis &&
mkdir dstat access-analysys sql-analysys &&
mkdir ./dstat/dstat-res-analysis &&
mkdir ./access-analysys/acc-res-analysis &&
mkdir ./sql-analysys/sql-res-analysis &&
mkdir ./dstat/log ./access-analysys/log ./sql-analysys/log &&
cd ../ &&
mkdir backup-def &&
cd backup-def &&
mkdir AP DB WEB &&
cd ../ &&
tree -L 4
