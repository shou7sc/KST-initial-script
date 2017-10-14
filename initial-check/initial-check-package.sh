#!/bin/sh

##########################################################
#
# variable
#
##########################################################

mysqlpass="*****"
MySQLSYSNAME=`systemctl list-units --type=service |grep "mysql"|awk '{print $1}'`
ApacheSYSNAME=`systemctl list-units --type=service |grep "apache2"|awk '{print $1}'`
NginxSYSNAME=`systemctl list-units --type=service |grep "nginx"|awk '{print $1}'`

##########################
#
# DB - MySQL,mariaDB
#
##########################

echo "###########################################################"
echo "#"
echo "# DB ------MySQL"
echo "#"
echo "###########################################################"
echo " "
echo "#------------------------------------------------------------------------"
echo "1.mysql パッケージ確認----dpkg -l|grep mysql-server"
echo "#------------------------------------------------------------------------"
echo " "

dpkg -l |grep mysql-server

if [ $? = 0 ] ; then
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "2.mysql はインストールされています.起動プロセスは下記"
    echo "#---------------------------------------------------------------------"
    echo " "
    ps auxfww | grep "mysql" |grep -v "grep" &&
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "3.mysqlバージョン確認" ;
    echo "#---------------------------------------------------------------------"
    echo " "
    mysqladmin -u root -p$mysqlpass version |grep "Server version" |awk '{print $3}'|cut -d- -f1 &&
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "4.systemd 自動起動設定確認、status確認"
    echo "#---------------------------------------------------------------------"
    echo " "
    systemctl list-unit-files |grep mysql
    MySQLAutoStart=`systemctl list-unit-files |grep mysql|awk '{print $2}'`
    [ $MySQLAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません"
    echo " "
    echo "#----------systemd コマンド一覧----------------------------------------"
    echo "systemctl status $MySQLSYSNAME #ステータス確認,自動起動設定確認"
    echo "systemctl restart $MySQLSYSNAME #再起動"
    echo "systemctl enable $MySQLSYSNAME #自動起動設定"
    echo "#---------------------------------------------------------------------"
    echo " "
else
    echo "2.mysql は インストールされていません------------------------------"
fi
    echo " "
    echo " "

##########################
#
# WEB - apache,nginx
#
##########################

# apache

echo "#########################################################"
echo "#"
echo "# WEB ------Apache-----httpd--------"
echo "#"
echo "########################################################"
echo " "
echo "1.----Apache パッケージ確認-dpkg -l |grep apache2---------------------------"
echo " "

dpkg -l |grep "apache2"

if [ $? = 0 ] ; then
    echo "#---------------------------------------------------------------------"
    echo "2.apache2 はインストールされています.起動プロセスは下記"
    echo "#---------------------------------------------------------------------"
    echo " "
    ps auxfww | egrep 'apache2' |grep -v "grep" &&
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "3.apache2バージョン確認"
    echo "#---------------------------------------------------------------------"
    echo " "
    apache2 -v
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "4.systemd 自動起動設定確認、status確認"
    echo "#---------------------------------------------------------------------"
    echo " " ;
    echo " " ;
    ApacheAutoStart=`systemctl list-unit-files |grep "apache2" |awk '{print $2}'`
    [ $ApacheAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません" &&
    systemctl list-unit-files |grep "apache2"
    echo "#----------systemd コマンド一覧----------------------------------------"
    echo "systemctl status $ApacheSYSNAME #ステータス確認,自動起動設定確認"
    echo "systemctl restart $ApacheSYSNAME #再起動"
    echo "systemctl enable $ApacheSYSNAME #自動起動設定"
    echo "#---------------------------------------------------------------------"
    echo " "
else
    echo "2.----apche2 は インストールされていません---------------------------"
fi
    echo " "
    echo " "

# Nginx

echo "#########################################################"
echo "#"
echo "# WEB ------Nginx-------------"
echo "#"
echo "########################################################"
echo " "
echo "1.----Nginx パッケージ確認-dpkg -l |grep nginx---------------------------"
echo " "

dpkg -l |grep "nginx"

if [ $? = 0 ] ; then
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "2.nginx はインストールされています.起動プロセスは下記"
    echo "#---------------------------------------------------------------------"
    echo " "
    ps auxfww | egrep 'nginx' |grep -v "grep"
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "3.nginxバージョン確認"
    echo "#---------------------------------------------------------------------"
    echo " "
    nginx -v
    echo " "
    echo "#---------------------------------------------------------------------"
    echo "4.systemd 自動起動設定確認、status確認"
    echo "#---------------------------------------------------------------------"
    echo " "
    systemctl list-unit-files |grep "nginx" &&
    NginxAutoStart=`systemctl list-unit-files |grep "nginx" |awk '{print $2}'` &&
    [ $NginxAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません"
    echo " "
    echo "#----------systemd コマンド一覧----------------------------------------"
    echo "systemctl status $NginxSYSNAME #ステータス確認,自動起動設定確認"
    echo "systemctl restart $NginxSYSNAME #再起動"
    echo "systemctl enable $NginxSYSNAME #自動起動設定"
    echo "#---------------------------------------------------------------------"
    echo " "
else
    echo "2.---Nginx は インストールされていません---------------------------"
fi
    echo " "
    echo " "
