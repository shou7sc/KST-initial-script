# isucon-initial-2017-for KST

isucon-initial-2017 KST

- official
    - http://isucon.net/

##### description

```
root@isucon6-image:~# tree
.
├── analysis (分析用ディレクトリ)
│   ├── access-analysys
│   │   ├── 01-log
│   │   └── 02-acc-res-analysis
│   ├── dstat
│   │   ├── 01-log
│   │   └── 02-dstat-res-analysis
│   └── sql-analysys
│       ├── 01-log
│       └── 02-sql-res-analysis
├── backup-def (デフォルト用ディレクトリ)
│   ├── AP
│   │   ├── isuda-def 
│   │   │   ├── views
│   │   │   │   ├── authenticate.erb
│   │   │   │   ├── index.erb
│   │   │   │   ├── _keyword.erb
│   │   │   │   ├── keyword.erb
│   │   │   │   ├── layout.erb
│   │   │   │   └── register.erb
│   │   │   └── web.rb
│   │   └── isutar-def
│   │       └── web.rb
│   ├── DB
│   │   ├── my.cnf.def
│   │   └── mysql-backup-def.sql
│   └── WEB
│       └── nginx.conf.def
└── kst-initial-script
    ├── initial-backup #初期バックアップスクリプト群)
    │   ├── initial-backup.sh
    │   └── mysqldump-def-create.sh
    ├── initial-check #初期システム構成把握用スクリプト群
    │   ├── git-ping-check.sh
    │   └── initial-check-package.sh
    ├── initial-intall #初期パッケージインストールスクリプト群
    │   ├── alp-install.sh
    │   ├── initial-install-wrapper.sh
    │   ├── netdata-install.sh
    │   ├── package-install.sh
    │   └── pt-query-digest-install.sh
    ├── initial-setting #初期設定スクリプト群
    │   ├── initial-nginx-setting.sh
    │   ├── initial-useradd.sh
    │   └── root-dir-create.sh
    ├── README.md
    └── script (便利スクリプト群)
        ├── bench-finish-for-ruby.sh
        ├── mysqldump-create.sh
        ├── mysqldump-restore.sh
        ├── rest-app-for-python.sh
        └── rest-app-for-ruby.sh
```

#### 

