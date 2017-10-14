#!/bin/bash

########################
# - variable
#-----------------------


########################

mysqldump -u root -proot -x --all-databases > /root/backup-def/DB/mysql-backup-def.sql &&

if [  $? = 0  ]; then
  echo "正常にダンプファイルが作成されました"
  echo `ls -al /root/backup-def/DB/mysql-backup-def.sql`
else
  echo "正常にダンプファイルが作成されませんでした"
fi
