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
cd ../ &&
mkdir backup-def &&
cd backup-def &&
mkdir AP DB WEB &&
cd ../ &&
tree -L 2 
