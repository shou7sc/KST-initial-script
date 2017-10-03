#!/bin/sh

###################################################
#
# pt-query-digest(percona-toolkit_3.0.4-1) install
#
###################################################
#
#
# MySQL percona-toolkit 依存パッケージ一覧-mysqlはインストールされている想定
# sudo apt-get install mysql-common libmysqlclient20
#
#
# percona-toolkit depend package list --------------------
#
# - 1.libdbi-perl
# - 2.libdbd-mysql-perl
# - 3.libterm-readkey-perl
# - 4.libio-socket-ssl-perl
# - 5.libnet-ssleay-perl
# - 6.percona-toolkit-pt-query-digest
##################################################################

printf "###########################################################\n"
printf "# - percona-toolkit-pt-query-digestのインストールを開始します。 \n"
printf "#\n"
printf "#\n"
printf "# - 1.libdbi-perl\n"
printf "# - 2.libdbd-mysql-perl\n"
printf "# - 3.libterm-readkey-perl\n"
printf "# - 4.libio-socket-ssl-perl\n"
printf "# - 5.libnet-ssleay-perl\n"
printf "# - 6.percona-toolkit-pt-query-digest\n"
printf "###########################################################\n"
printf " \n"
printf " \n"

apt-get update &&
cd /usr/local/src &&
sudo wget "http://kr.archive.ubuntu.com/ubuntu/pool/main/libd/libdbi-perl/libdbi-perl_1.634-1build1_amd64.deb" &&
sudo wget "http://security.ubuntu.com/ubuntu/pool/universe/libd/libdbd-mysql-perl/libdbd-mysql-perl_4.033-1ubuntu0.1_amd64.deb" &&
sudo wget "http://kr.archive.ubuntu.com/ubuntu/pool/universe/libt/libterm-readkey-perl/libterm-readkey-perl_2.33-1build1_amd64.deb" &&
sudo wget "http://kr.archive.ubuntu.com/ubuntu/pool/main/libn/libnet-ssleay-perl/libnet-ssleay-perl_1.72-1build1_amd64.deb" &&
sudo wget "http://kr.archive.ubuntu.com/ubuntu/pool/main/libi/libio-socket-ssl-perl/libio-socket-ssl-perl_2.024-1_all.deb" &&
sudo wget "https://www.percona.com/downloads/percona-toolkit/3.0.4/binary/debian/xenial/x86_64/percona-toolkit_3.0.4-1.xenial_amd64.deb"

# - libdbi-perl dpkg -i and check

ls libdbi-perl_1.634-1build1_amd64.deb &&
dpkg -i "libdbi-perl_1.634-1build1_amd64.deb"
sudo dpkg -l |grep "libdbi-perl"
if [  $? = 0  ]; then
  sudo dpkg -l |grep "libdbi-perl"
  printf "1.libdbi-perl は正常にインストールされました\n"
else
  printf "1.libdbi-perl はインストールできませんでした\n"
fi

# - libdbd-mysql-perl  dpkg -i and check

ls libdbd-mysql-perl_4.033-1ubuntu0.1_amd64.deb &&
dpkg -i "libdbd-mysql-perl_4.033-1ubuntu0.1_amd64.deb"
sudo dpkg -l |grep "libdbd-mysql-perl"
if [  $? = 0  ]; then
  sudo dpkg -l |grep "libdbd-mysql-perl"
  printf "2.libdbd-mysql-perl は正常にインストールされました\n"
else
  printf "2.libdbd-mysql-perl はインストールできませんでした\n"
fi
# - libterm-readkey-perl  dpkg -i and check

ls libterm-readkey-perl_2.33-1build1_amd64.deb &&
dpkg -i "libterm-readkey-perl_2.33-1build1_amd64.deb"

sudo dpkg -l |grep "libterm-readkey-perl"

if [  $? = 0  ]; then
  sudo dpkg -l |grep "libterm-readkey-perl"
  printf "3.libterm-readkey-perl は正常にインストールされました\n"
else
  printf "3.libterm-readkey-perl はインストールできませんでした\n"
fi

#- libio-socket-ssl-perl  dpkg -i and check

ls libnet-ssleay-perl_1.72-1build1_amd64.deb &&
dpkg -i "libnet-ssleay-perl_1.72-1build1_amd64.deb" &&
sudo dpkg -l |grep "libnet-ssleay-perl"
if [  $? = 0  ]; then
  sudo dpkg -l |grep "libnet-ssleay-perl"
  printf "4.libnet-ssleay-perl は正常にインストールされました\n"
else
  printf "4.libnet-ssleay-perl はインストールできませんでした\n"
fi

# - libnet-ssleay-perl  dpkg -i and check

ls libio-socket-ssl-perl_2.024-1_all.deb &&
dpkg -i "libio-socket-ssl-perl_2.024-1_all.deb" &&
sudo dpkg -l |grep "libnet-ssleay-perl"
if [  $? = 0  ]; then
  sudo dpkg -l |grep "libnet-ssleay-perl"
  printf "5.libnet-ssleay-perl は正常にインストールされました\n"
else
  printf "5.libnet-ssleay-perl はインストールできませんでした\n"
fi

# percona-toolkit and  pt-query-digest

ls percona-toolkit_3.0.4-1.xenial_amd64.deb &&
sudo dpkg -i percona-toolkit_3.0.4-1.xenial_amd64.deb &&
if [  $? = 0  ]; then
  sudo dpkg -l |grep "percona-toolkit"
  printf "6.percona-toolkit は正常にインストールされました\n"
else
  printf "6.lpercona-toolkit はインストールできませんでした\n"
fi

updatedb

PTCOM=`locate pt-query-digest |grep "bin"`
if [ $PTCOM = "/usr/bin/pt-query-digest" ]; then
  echo PATH = `locate pt-query-digest |grep "bin"`
  printf "pt-query-digest は正常にインストールされました\n"
else
  printf "pt-query-digest はインストールできませんでした\n"
fi
