#!/bin/bash

########################
# - variable
#-----------------------

rootpass="****"

########################

mysqldump -u root -p[@rootpass] –all-databases > mysql-backup-def.sql &&

ls mysql-backup-def.sql

if [  $? = 0  ]; then
  echo "正常にダンプファイルが作成されました"
  echo `ls -al mysql-backup-def.sql`
else
  echo "正常にダンプファイルが作成されました"
fi
