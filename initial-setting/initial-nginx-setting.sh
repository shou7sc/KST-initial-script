#!/bin/bash

#################################################################################
#
# - variable
#
#################################################################################


NGINXCONF=/etc/nginx/nginx.conf
ADDLINENUMBER=$((`cat -n $NGINXCONF | grep "http {" |awk {'print $1'}` + 1))


#################################################################################

echo "------------------------------------------------------------------------"
echo "                                                                        "
echo "1.nginxの設定ファイル初期設定を行います........" 
echo "                                                                       "
echo "------------------------------------------------------------------------" ; sleep 3
 
egrep 'log_format|access_log' $NGINXCONF

if [ $? = 0 ];then
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === fail                                                       "
    echo "                - log_formatまたはaccess_log ディレクティブのどちらかがすでに設定済みです。"
    echo "                - $NGINXCONF の設定箇所を消して再度実行してください."
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
    exit 1
else
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === success                                                  "
    echo "                                                                        "
    echo " $NGINXCONF にlog_format|access_log の設定がありません。 "
    echo " 書き換えが可能です。                                                   "
    echo "                                                                        "
    echo "------------------------------------------------------------------------" ; sleep 3
fi
    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo " 2.$NGINXCONF のバックアップを取得します........." 
    echo "                                                                        "
    echo "------------------------------------------------------------------------" ; sleep 3

cp -ap $NGINXCONF "$NGINXCONF.`date '+%Y%m%d_%H%M'`" &&

mv "$NGINXCONF.`date '+%Y%m%d_%H%M'`" /root/backup-def/WEB/ && 

if [ $? = 0 ];then
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === success                                                  "
    echo "                                                                        "
    echo " バックアップが正常に取得できました。"
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
else
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === fail                                                     "
    echo "                                                                        "
    echo " バックアップが正常に取得できませんでした。"
    echo " 再度実行してください。                                                 "
    echo "------------------------------------------------------------------------" 
    exit 1
fi

    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo " 3.$NGINXCONF を書き換えます ........." 
    echo "                                                                        "
    echo "------------------------------------------------------------------------" ; sleep 3 &&

sed -i ""$ADDLINENUMBER"i\log_format ltsv \"time:\$time_local\"\n\
                \"\\\thost:\$remote_addr\"\n\
                \"\\\tforwardedfor:$\http_x_forwarded_for\"\n\
                \"\\\treq:\$request\"\n\
                \"\\\tstatus:\$status\"\n\
                \"\\\tmethod:\$request_method\"\n\
                \"\\\turi:\$request_uri\"\n\
                \"\\\tsize:\$body_bytes_sent\"\n\
                \"\\\treferer:\$http_referer\"\n\
                \"\\\tua:\$http_user_agent\"\n\
                \"\\\treqtime:\$request_time\"\n\
                \"\\\tcache:\$upstream_http_x_cache\"\n\
                \"\\\truntime:\$upst:wream_http_x_runtime\"\n\
                \"\\\tapptime:\$upstream_response_time\"\n\
                \"\\\tvhost:\$host\";\n\
    access_log  /var/log/nginx/access-log  ltsv;" $NGINXCONF

if [ $? = 0 ];then
    echo "$NGINXCONF"
    echo "------------------------------------------------------------------------"
    cat $NGINXCONF
    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === success                                                  "
    echo "                                                                        "
    echo "                                                                        "
    echo " $NGINXCONF の設定が正常に設定が書き換えられました。"
    echo "                                                                        "
    echo "                                                                        "
    echo "------------------------------------------------------------------------"
else
    echo "$NGINXCONF"
    echo "------------------------------------------------------------------------"
    cat $NGINXCONF 
    echo "------------------------------------------------------------------------"
    echo "                                                                        "
    echo "                                                                        "
    echo " [result]  === fail                                                       "
    echo "                                                                        "
    echo "                                                                        "
    echo " $NGINXCONF の設定が正常に設定が書き換えられませんでした。"
    echo "                                                                        "
    echo "                                                                        "
    echo "------------------------------------------------------------------------" 
fi
