## VM VirtualBox 仮想マシン(LAMP)作成
- ブラウザで確認
- Git
- composer
- phpcs

## 仮想マシン > 新規
- 名前とオペレーティングシステム
  - 名前：training
  - マシンフォルダ：C\Users\ユーザー名\VirtualBox VMs
  - タイプ：Linux
  - バージョン：Red Hat(64-bit)
- メモリーサイズ
  - 1024MB
- ハードディスク
  - 仮想ハードディスクを作成する
  - ハードディスクのファイルタイプ
    - VDI
  - 物理ハードディスクにあるストレージ
    - 可変サイズ
  - ファイルの場所とサイズ
    - C:\Users\ユーザー名\VirtualBox VMs\training\training.vdi
    - 16GB

## 設定
- ネットワーク
  - 割り当て：NAT -> ブリッジアダプター
- ストレージ
  - コントローラー:IDE > 空 をクリック
  - 属性 > 光学ドライブ:IDEセカンダリマスター の右の DVD/CDボタンをクリック
  - ディスクファイルを選択.. をクリック
  - ダウンロードしたCentOS7の仮想光学ディスクファイルを選択
  - OK

## CentOS7 インストール
https://laboratory.kazuuu.net/try-installing-centos-7-on-virtualbox-windows-10/

## module
### apache
- 提供されている Apache httpd 2.4 を確認
yum info httpd
- Apache httpd 2.4 をインストール
yum -y install httpd
- 確認
httpd -v
- 自動起動の設定
systemctl enable httpd.service
- 起動
systemctl start httpd.service

### mod_ssl
yum -y install mod_ssl

### mysql
- MariaDBの削除
yum remove mariadb-libs -y
rm -rf /var/lib/mysql

- 公式Yumリポジトリ追加
yum localinstall -y http://dev.mysql.com/get/mysql80-community-release-el7-7.noarch.rpm
- MySQL Server　をインストール
yum install -y mysql-community-server
- MySQL のバージョン確認
mysqld --version
/usr/sbin/mysqld  Ver 8.0.31 for Linux on x86_64 (MySQL Community Server - GPL)
- 自動起動設定
systemctl enable mysqld
- 起動
systemctl start mysqld
- 状態確認
systemctl status mysqld
- 初期パスワードの確認
cat /var/log/mysqld.log | grep root
- ログイン出来るか確認
mysql -uroot -p // 確認したパスワード
\q // ログアウト
- パスワードの変更
mysql_secure_installation
Enter password for user root: 初期パスワード
New password: P@ssw0rd // 新しいパスワード
Re-enter new password: P@ssw0rd // 新しいパスワード再入力
Change the password for root?(Press y|Y for Yes, any other key for No) : y
New password: P@ssw0rd // 新しいパスワード
Re-enter new password: P@ssw0rd // 新しいパスワード再入力
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
Remove anonymous users? (Press y|Y for Yes, any other key for No) : y // 匿名ユーザーを削除
Disallow root login remotely? (Press y|Y for Yes, any other key for No) : n // リモートからrootログインを許可
Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y

### PHP
https://rpms.remirepo.net/wizard/

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
yum-config-manager --disable 'remi-php*'
yum-config-manager --enable   remi-php81
yum repolist
yum update
yum install php-cli
yum install php
yum --enablerepo=remi-php81-test install php // PHPモジュールは下記
php --version
```
PHP 8.1.12 (cli) (built: Oct 25 2022 17:30:00) (NTS gcc x86_64)
Copyright (c) The PHP Group
Zend Engine v4.1.12, Copyright (c) Zend Technologies
```

[root@localhost ~]# php -m
[PHP Modules]
bz2
calendar
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
gettext
hash
iconv
imap
json
libxml
mbstring
mcrypt
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
readline
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
xsl
zlib

### httpd
/etc/httpd/conf/httpd.conf
```
    144 # 変更点
    145 #    Options Indexes FollowSymLinks
    146     Options FollowSymLinks
...
    153 # 変更点
    154 #    AllowOverride None
    155     AllowOverride All

```

/etc/httpd/conf.d/vhost.conf
```
#####################################################
# HTTP
#####################################################

## NameVirtualHost *:80

#
# default
#
<VirtualHost *:80>
    ServerName www.training.develop.local
    ServerAdmin webmaster.www@training.develop.local
    DocumentRoot /var/www/html/
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" fmt_www
    ErrorLog /var/log/httpd/www_error_log
    CustomLog /var/log/httpd/www_access_log fmt_www
    <Directory "/var/www/html">
        Options ExecCGI Includes FollowSymLinks
        AllowOverride All
        ##Order allow,deny
        ##Allow from all
        Require all granted
    </Directory>
</VirtualHost>

#####################################################
# HTTPS
#####################################################

## NameVirtualHost *:80

#
# SSL default
#
<VirtualHost *:443>
    ServerName www.training.develop.local
    ServerAdmin webmaster.www@training.develop.local
    DocumentRoot /var/www/html/
    SSLEngine on
    ##SSLCertificateFile /etc/httpd/ssl/local-server.crt
    ##SSLCertificateKeyFile /etc/httpd/ssl/local-server.key
    SSLCertificateFile /etc/pki/tls/certs/localhost.crt
    SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
    #SSLCertificateKeyFile /etc/httpd/ssl/local-server-nopass.key
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" fmt_ssl_www
    ErrorLog /var/log/httpd/ssl_www_error_log
    CustomLog /var/log/httpd/ssl_www_access_log fmt_ssl_www
    <Directory "/var/www/html">
        Options ExecCGI Includes FollowSymLinks
        AllowOverride All
        ##Order allow,deny
        ##Allow from all
        Require all granted
    </Directory>
</VirtualHost>
```

### selinux 無効化
- 確認
getenforce
- 変更
vi /etc/selinux/config
```
#SELINUX=enforcing
SELINUX=disabled
```
- 再起動
reboot
- 確認 Disabledか
getenforce

### firewalldにhttpとhttpsサービスを許可
- 現状確認
firewall-cmd --list-all
- http, https を永続的に許可
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
- firewalld を再起動
firewall-cmd --reload
- 確認
firewall-cmd --list-all

### /etc/php.ini
```
    927 date.timezone = "Asia/Tokyo"
```

### composer インストール
https://getcomposer.org/download/
- グローバル化
sudo mv composer.phar /usr/local/bin/composer

### PHP CS
※user でインストール
composer global require squizlabs/php_codesniffer

### Git インストール
https://reigle.info/entry/2022/08/09/100000
https://qiita.com/tomy0610/items/66e292f80aa1adc1161d
https://github.com/git/git/tags

- 依存関係のあるライブラリをインストール
yum -y install gcc curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf wget
- 適切なダウンロードディレクトリへ移動
cd /usr/local/src/
- 圧縮ファイルをダウンロード
wget https://github.com/git/git/archive/refs/tags/v2.38.1.tar.gz
- 解凍
tar xzvf v2.38.1.tar.gz
- 圧縮ファイルを削除
rm v2.38.1.tar.gz
- インストール
cd git-2.38.1/
make prefix=/usr/local/ all
make prefix=/usr/local/ install
- 確認
git --version
git version 2.38.1

### VSCode
- 拡張機能
  - ローカル
    - Remote - SSH
  - リモート
    - PHP Mess Detector
    - phpcs

C:\Users\ユーザー名\.ssh\config
```
Host 192.168.12.68
  HostName 192.168.12.68
  User user
```

workspace: /var/www/html/

workspaceのsetting.json (/var/www/html/.vscode/setting.json)
```
{
    "phpcs.executablePath": "/home/user/.config/composer/vendor/bin/phpcs",
    "phpcs.standard": "/home/user/.config/phpcs/ruleset.xml",
    "phpmd.rules": "/home/user/.config/phpmd/ruleset.xml",
}
```

### windows hosts
- メモ帳 右クリック > 管理者として実行
- デバイスへの変更を許可 > はい
- ファイル > 開く
- C:\Windows\System32\drivers\etc\ ※テキスト文書 → すべてのファイル に変更
- C:\Windows\System32\drivers\etc\hosts 編集
```
__IP__ www.training.develop.local
```
- 保存
- ブラウザ確認 http://www.training.develop.local

### IPアドレスが表示されない場合
インストール時にネットワークアダプタを自動接続にしているか確認
nmcli con show enp0s3 | grep connection
で、autoconnectがno(いいえ) だった場合
nmcli con mod enp0s3 connection.autoconnect “yes”
で有効にし、rebootする
