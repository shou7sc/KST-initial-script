#!/bin/bash

bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)

if [  $? = 0  ]; then
  echo "netdata は正常にインストールされました"
else
  echo "netdata はインストールできませんでした"
fi
