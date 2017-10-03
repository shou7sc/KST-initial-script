#!/bin/sh

##########################################################
#
# Environment variable
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

printf "###########################################################\n"
printf "#\n"
printf "# DB ------MySQL\n"
printf "#\n"
printf "###########################################################\n"
printf " \n"
printf "#------------------------------------------------------------------------\n"
printf "1.mysql パッケージ確認----dpkg -l|grep mysql-server\n"
printf "#------------------------------------------------------------------------\n"
printf " \n"

dpkg -l |grep mysql-server

if [ $? = 0 ] ; then
    printf " \n"
    printf "#---------------------------------------------------------------------\n" ;
    printf "2.mysql はインストールされています.起動プロセスは下記\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
    ps auxfww | grep "mysql" |grep -v "grep"
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "3.mysqlバージョン確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    mysqladmin -u root -p$mysqlpass version |grep "Server version" |awk '{print $3}'|cut -d- -f1 ;
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "4.systemd 自動起動設定確認、status確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    systemctl list-unit-files |grep mysql
    MySQLAutoStart=`systemctl list-unit-files |grep mysql|awk '{print $2}'`
    [ $MySQLAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません"
    printf " \n"
    printf "#----------systemd コマンド一覧----------------------------------------\n"
    printf "systemctl status $MySQLSYSNAME #ステータス確認,自動起動設定確認\n"
    printf "systemctl restart $MySQLSYSNAME #再起動\n"
    printf "systemctl enable $MySQLSYSNAME #自動起動設定\n"
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
else
    printf " \n2.mysql は インストールされていません------------------------------\n"
fi
    printf " \n"
    printf " \n"

##########################
#
# WEB - apache,nginx
#
##########################

# apache

printf "#########################################################\n"
printf "#\n"
printf "# WEB ------Apache-----httpd--------\n"
printf "#\n"
printf "########################################################\n"
printf " \n"
printf "1.----Apache パッケージ確認-dpkg -l |grep apache2---------------------------\n"
printf " \n"

dpkg -l |grep "apache2"

if [ $? = 0 ] ; then
    printf "#---------------------------------------------------------------------\n" ;
    printf "2.apache2 はインストールされています.起動プロセスは下記\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
    ps auxfww | egrep 'apache2' |grep -v "grep"
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "3.apache2バージョン確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    apache2 -v
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "4.systemd 自動起動設定確認、status確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    printf " \n" ;
    ApacheAutoStart=`systemctl list-unit-files |grep "apache2" |awk '{print $2}'`
    [ $ApacheAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません"
    systemctl list-unit-files |grep "apache2"
    printf "#----------systemd コマンド一覧----------------------------------------\n"
    printf "systemctl status $ApacheSYSNAME #ステータス確認,自動起動設定確認\n"
    printf "systemctl restart $ApacheSYSNAME #再起動\n"
    printf "systemctl enable $ApacheSYSNAME #自動起動設定\n"
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
else
    printf " \n2.----httpd は インストールされていません---------------------------\n"
fi
    printf " \n"
    printf " \n"

# Nginx

printf "#########################################################\n"
printf "#\n"
printf "# WEB ------Nginx-------------\n"
printf "#\n"
printf "########################################################\n"
printf " \n"
printf "1.----Nginx パッケージ確認-dpkg -l |grep nginx---------------------------\n"
printf " \n"

dpkg -l |grep "nginx"

if [ $? = 0 ] ; then
    printf " \n"
    printf "#---------------------------------------------------------------------\n" ;
    printf "2.nginx はインストールされています.起動プロセスは下記\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
    ps auxfww | egrep 'nginx' |grep -v "grep"
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "3.nginxバージョン確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    nginx -v
    printf " \n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf "4.systemd 自動起動設定確認、status確認\n" ;
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n" ;
    systemctl list-unit-files |grep "nginx"
    NginxAutoStart=`systemctl list-unit-files |grep "nginx" |awk '{print $2}'`
    [ $NginxAutoStart = enabled ] && echo "自動起動設定が有効です" || echo "自動起動設定がされていません"
    printf " \n"
    printf "#----------systemd コマンド一覧----------------------------------------\n"
    printf "systemctl status $NginxSYSNAME #ステータス確認,自動起動設定確認\n"
    printf "systemctl restart $NginxSYSNAME #再起動\n"
    printf "systemctl enable $NginxSYSNAME #自動起動設定\n"
    printf "#---------------------------------------------------------------------\n" ;
    printf " \n"
else
    printf " \n2.----httpd は インストールされていません---------------------------\n"
fi
    printf " \n"
    printf " \n"

