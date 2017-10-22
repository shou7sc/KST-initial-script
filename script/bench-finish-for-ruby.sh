#!/bin/bash
set -ex

#################################
# - nginx accsess log analysys
#################################

cat /var/log/nginx/access_log | alp -r  >> /root/analysis/access-analysys/02-acc-res-analysis/access-analysys.txt.$(date "+%Y%m%d_%H%M%S") &&

if [ -f /var/log/nginx/access_log ]; then
    sudo mv /var/log/nginx/access_log /root/analysis/access-analysys/01-log/access_log.$(date "+%Y%m%d_%H%M%S")
fi

ls -al /root/analysis/access-analysys/01-log/access_log.$(date "+%Y%m%d_%H%M%S")

##################################
# - mysql sql analysys 
#################################

pt-query-digest --limit 10 /var/lib/mysql/isucon-slow.log >> /root/analysis/sql-analysys/02-sql-res-analysis/sql-analysys.txt.$(date "+%Y%m%d_%H%M%S") &&

if [ -f /var/lib/mysql/isucon-slow.log ]; then
    sudo mv /var/lib/mysql/isucon-slow.log /root/analysis/sql-analysys/01-log/isucon-slow.log.$(date "+%Y%m%d_%H%M%S")
fi

ls -al /root/analysis/sql-analysys/01-log/isucon-slow.log.$(date "+%Y%m%d_%H%M%S")


sudo systemctl restart isubata.ruby.service &&
sudo systemctl restart nginx.service

tree /root/analysis/
