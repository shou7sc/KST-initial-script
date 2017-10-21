#!/bin/bash

########################
# - variable
#-----------------------

########################

source /root/backup/DB/mysql-backup-def.sql  &&
mysql -u root -proot < /root/backup/mysql-backup-def.sql  &&
#time mysql -uroot -proot mysql-backup-def.sql.log 2>&1
