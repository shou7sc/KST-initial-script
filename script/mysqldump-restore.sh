#!/bin/bash

########################
# - variable
#-----------------------

rootpass="****"

########################

source mysql-backup-def.sql  &&
mysql -u root -p{$rootpass} < mysql-backup-def.sql  &&
time mysql -uroot -p{$rootpass} mysql-backup-def.sql.log 2>&1
