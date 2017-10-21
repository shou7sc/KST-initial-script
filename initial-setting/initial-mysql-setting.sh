#!/bin/bash

#################################################################################
#
# - variable
#
#################################################################################

MYCONF=/etc/mysql/my.cnf
ADDLINENUMBER=$((`cat -n $MYCONF | egrep "\[mysqld\]" |awk {'print $1'}` + 1))

#################################################################################

echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "1. $MYCONF の設定ファイル初期設定を行います........"
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 3

egrep 'slow_query_log|slow_query_log_file|long_query_time' $MYCONF

if [ $? = 0 ];then
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;31mfail\033[0;39m"
    echo "                - slow_query_log,slow_query_log_file,long_query_timeのいずれかがすでに設定済みです。"
    echo "                - $MYCONF の設定箇所を消して再度実行してください."
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
    exit 1
else
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;32msuccess\033[0;39m                           "
    echo "                                                                        "
    echo " $MYCONF に slow_query_log,slow_query_log_file,long_query_time の設定がありません。 "
    echo " 書き換えが可能です。                                                   "
    echo "                                                                        "
    echo "------------------------------------------------------------------------" ; sleep 3
fi

echo "------------------------------------------------------------------------"
echo "                                                                        "
echo " 2.$MYCONF のバックアップを取得します........."
echo "                                                                        "
echo "------------------------------------------------------------------------" ; sleep 3

cp -ap $MYCONF "my.cnf.`date '+%Y%m%d_%H%M'`" &&
mv "my.cnf.`date '+%Y%m%d_%H%M'`" /root/backup-def/DB/

if [ $? = 0 ];then
ls -al /root/backup-def/DB/my.cnf.`date '+%Y%m%d_%H%M'`
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;32msuccess\033[0;39m                           "
    echo "                                                                        "
    echo " バックアップが正常に取得できました。"
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
else
ls -al /root/backup-def/DB/my.cnf.`date '+%Y%m%d_%H%M'`
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;31mfail\033[0;39m                              "
    echo "                                                                        "
    echo " バックアップが正常に取得できませんでした。"
    echo " 再度実行してください。                                                 "
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
    exit 1
fi

    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo " 3.$MYCONF を書き換えます ........."
    echo "                                                                        "
    echo "------------------------------------------------------------------------" ; sleep 3 &&

sed -i ""$ADDLINENUMBER"i\slow_query_log = 1 \n\
slow_query_log_file = /var/lib/mysql/isucon-slow.log\n\
long_query_time = 0" $MYCONF

if [ $? = 0 ];then
    echo "$MYCONF"
    echo "------------------------------------------------------------------------"
    cat $MYCONF
    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;32msuccess\033[0;39m                           "
    echo "                                                                        "
    echo "                                                                        "
    echo " $MYCONF の設定が正常に設定が書き換えられました。"
    echo "                                                                        "
    echo " mysqld --verbose --help                                                "
    echo " systemctl restart mysql.service                                       "
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
else
    echo "$MYCONF"
    echo "------------------------------------------------------------------------"
    cat $MYCONF
    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo "                                                                        "
    echo -e " [result]  === \033[0;31mfail\033[0;39m                              "
    echo "                                                                        "
    echo "                                                                        "
    echo " $MYCONF の設定が正常に設定が書き換えられませんでした。"
    echo "                                                                        "
    echo "                                                                        "
    echo " mysqld --verbose --help                                                "
    echo " systemctl restart mysql.service                                       "
    echo "                                                                        "
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
fi
