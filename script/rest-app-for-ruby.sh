#!/bin/bash
set -ex

if [ -f /var/lib/mysql/isucon-slow.log ]; then
    sudo mv /var/lib/mysql/isucon-slow.log /root/analysis/sql-analysys/01-log/isucon-slow.log.$(date "+%Y%m%d_%H%M%S")
fi
if [ -f /var/log/nginx/access_log ]; then
    sudo mv /var/log/nginx/access_log /root/analysis/access-analysys/01-log/access_log.$(date "+%Y%m%d_%H%M%S")
fi

sudo systemctl restart isubata.ruby.service &&
sudo systemctl restart nginx.service
