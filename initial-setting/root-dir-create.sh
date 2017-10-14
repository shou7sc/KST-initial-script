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
mkdir ./dstat/02-dstat-res-analysis &&
mkdir ./access-analysys/02-acc-res-analysis &&
mkdir ./sql-analysys/02-sql-res-analysis &&
mkdir ./dstat/01-log ./access-analysys/01-log ./sql-analysys/01-log &&
cd ../ &&
mkdir backup-def &&
cd backup-def &&
mkdir AP DB WEB &&
cd ../ &&
tree -L /root
