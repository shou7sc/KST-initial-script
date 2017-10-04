#/bin/bash

./initial-package-install.sh &&

if [  $? = 0  ]; then
  echo "initial-package は正常にインストールされました"
else
  echo "initial-package はインストールできませんでした"
fi

./alp-install.sh &&

if [  $? = 0  ]; then
  echo "alp は正常にインストールされました"
else
  echo "alp はインストールできませんでした"
fi

./netdata-install.sh &&

if [  $? = 0  ]; then
  echo "netdata は正常にインストールされました"
else
  echo "netdata はインストールできませんでした"
fi

./pt-query-digest-install.sh

if [  $? = 0  ]; then
  echo "pt-query-digest は正常にインストールされました"
else
  echo "pt-query-digest はインストールできませんでした"
fi
