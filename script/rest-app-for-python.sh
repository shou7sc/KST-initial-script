#!/bin/bash
set -ex

if [ -f /var/lib/mysql/isucon7-image-slow.log ]; then
    sudo mv /var/lib/mysql/isucon-slow.log /root/analysis/sql-analysys/isucon-slow.log.$(date "+%Y%m%d_%H%M%S")
fi
if [ -f /var/log/nginx/access-log ]; then
    sudo mv /var/log/nginx/access-log /root/analysis/access-analysys/access-log.$(date "+%Y%m%d_%H%M%S")
fi

sudo systemctl restart mysql.service
sudo systemctl restart isutar.python.service
sudo systemctl restart isuda.python.service
sudo systemctl restart nginx.service
