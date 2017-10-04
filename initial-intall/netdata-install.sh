#!/bin/bash

bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)

if [  $? = 0  ]; then
  echo "alp は正常にインストールされました"
else
  echo "alp はインストールできませんでした"
fi
