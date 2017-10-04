#!/bin/bash

echo "###########################################################"
echo "#"
echo "# - alpのインストールを開始します。"
echo "#"
echo "# https://github.com/tkuchiki/alp/"
echo "###########################################################"

cd /usr/local/src/ &&
sudo wget "https://github.com/tkuchiki/alp/releases/download/v0.3.1/alp_linux_amd64.zip" &&
sudo unzip "alp_linux_amd64.zip" &&
sudo mv "alp" /usr/local/bin/alp 

if [  $? = 0  ]; then
  echo "alp は正常にインストールされました"
else
  echo "alp はインストールできませんでした"
fi
