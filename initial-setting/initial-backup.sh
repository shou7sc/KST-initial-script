#!/bin/bash

#################################################################################
#
# - variable
#
#################################################################################

#-WEB
NGINXCONF=/etc/nginx/nginx.conf
#-AP
APCONFISUDA=/home/isucon/webapp/ruby/lib/isuda/
APCONFISUTAR=/home/isucon/webapp/ruby/lib/isutar/
#-DB
MYCONF=/etc/mysql/my.cnf

#################################################################################

cp -ap /etc/nginx/nginx.conf /root/backup-def/WEB/nginx.conf.def
cp -ap /home/isucon/webapp/ruby/lib/isuda/ /root/backup-def/AP/isuda-def
cp -ap /home/isucon/webapp/ruby/lib/isutar/ /root/backup-def/AP/isutar-def
cp -ap /etc/mysql/my.cnf /root/backup-def/DB/my.cnf.def

ll /root/backup-def/WEB/nginx.conf.def
ll /root/backup-def/AP/isuda-def
ll /root/backup-def/AP/isutar-def
ll /root/backup-def/DB/my.cnf.def
