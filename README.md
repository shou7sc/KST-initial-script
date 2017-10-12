# isucon-initial-2017-for KST

isucon-initial-2017 KST

- official
    - http://isucon.net/

##### description

```
├── initial-check
│   ├── git-ping-check.sh # git設定確認スクリプト
│   └── initial-check-package.sh # 初期インストールチェックスクリプト
├── initial-intall
│   ├── alp-install.sh #alpインストールスクリプト
│   ├── initial-install-wrapper.sh #初期インストール ラッパースクリプト
│   ├── netdata-install.sh #netdataインストールスクリプト
│   ├── package-install.sh #各種packageインストールスクリプト
│   └── pt-query-digest-install.sh #pt-query-digest インストールスクリプト
├── initial-setting
│   └── initial-useradd.sh #useradd and git setting 
├── README.md
└── script
    ├── mysqldump-create.sh # mysqldump取得用
    ├── mysqldump-restore.sh # mysqldump restore用
    ├── rest-app-for-python.sh # python app benchmark前 restart-script
    └── rest-app-for-ruby.sh # python app benchmark前 restart-script
```

* #mysqldump-restore.sh # mysqldump restore用
	* root pass を記載する必要あり
* initial-useradd.sh # useradd and git setting
	* user1 pw1
	* user2 pw2
	* user3 pw3
	* key-name
	* GIT\_COM\_HOSNAME
