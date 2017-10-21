#!/bin/bash

########################
# - variable
#-----------------------

rootpass="****"

########################

mysqldump -u root -proot –all-databases > /root/backup/DB/mysql-backup-sql.`date '+%Y%m%d_%H%M'` &&
ls /root/backup/DB/mysql-backup-sql.`date '+%Y%m%d_%H%M'`

if [  $? = 0  ]; then
  echo "正常にダンプファイルが作成されました"
ls -alth /root/backup/DB/mysql-backup-sql.`date '+%Y%m%d_%H%M'`
else
  echo "正常にダンプファイルが作成されました"
fi
