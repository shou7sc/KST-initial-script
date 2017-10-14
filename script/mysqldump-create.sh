#!/bin/bash

########################
# - variable
#-----------------------

rootpass="****"

########################

mysqldump -u root -p{$rootpass} –all-databases > mysql-backup.sql.`date '+%Y%m%d_%H%M'` &&

ls mysql-backup.sql.`date '+%Y%m%d_%H%M'`

if [  $? = 0  ]; then
  echo "正常にダンプファイルが作成されました"
  echo `ll -al mysql-backup-def.sql`
else
  echo "正常にダンプファイルが作成されました"
fi
