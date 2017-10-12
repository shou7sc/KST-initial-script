#/bin/bash

sudo apt-get update
sudo apt-get --yes install "dstat" "tree" "expect" "unzip" "mysql-common" "libmysqlclient20" "chrony"

echo "server ntp1.jst.mfeed.ad.jp offline iburst" >> /etc/chrony/chrony.conf &&
echo "server ntp2.jst.mfeed.ad.jp offline iburst" >> /etc/chrony/chrony.conf &&
echo "server ntp3.jst.mfeed.ad.jp offline iburst" >> /etc/chrony/chrony.conf &&
systemctl restart chrony.service &&
chronyc sources 

#################################
# reference
#################################
# - expect
#   - https://qiita.com/dogyear/items/e58ddab9a49bf82ed43f
#   - https://qiita.com/ine1127/items/cd6bc91174635016db9b
#
#
#
