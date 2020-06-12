# Apache HTTP Server (httpd)

* PCがWebサーバーとして機能するためのオープンソースソフトウェア

* Unixでは、httpd プログラムが、バックグラウンドで常にリクエスト処理を行う デーモンとして実行
* 設定 ( /etc/httpd/conf/httpd.conf )
* [Apache HTTP サーバ バージョン 2.4 ドキュメント](http://httpd.apache.org/docs/2.4/ja/)

## DocumentRoot の変更
---

DocumentRoot : クライアントからのアクセスを許可するディレクトリ、つまりブラウザから直接アクセス可能なファイルを設置する場所

1. `# vim /etc/httpd/conf/httpd.conf`
2. 初期値 `/var/www/html` を書き換え

```
DocumentRoot "PHPファイルを入れるディレクトリ名"

#
# Relax access to content within /var/www.
#
<Directory "/var/www">
    AllowOverride None
    # Allow open access:
    Require all granted
</Directory>

# Further relax access to the default document root:
<Directory "PHPファイルを入れるディレクトリ名">
```

3. Apache 再起動 <br> `# service httpd restart`
4. DocumentRoot のディレクトリにパーミッションを付与 <br> `$ chmod モード数字 対象ディレクトリ名`

## VirtualHost (Name, IP, Mixed port -based)
---

下記では、80, 8080ポートによって異なるレスポンスを実現してみる

1. Listen ディレクティブにポート番号を追加
   1. `/etc/httpd/conf/httpd.conf` にて `Listen 8080` 追記
2. VirtualHost の設定を作成
   1. `/etc/httpd/conf.d` にて `$ touch training.vhost.conf` [^1]
   2. 最低限の設定[^2]
```
<VirtualHost *:80> ← 異なるポート番号
 DocumentRoot /var/www/html/abc_vhost ← 異なるドキュメントルート
 ServerName 192.168.56.103:80
</VirtualHost>

<VirtualHost *:8080>
 DocumentRoot /var/www/html/xyz_vhost
 ServerName 192.168.56.103:80
</VirtualHost>
```
[^1]: ファイル名は自由だがホスト名に合わせるのが吉、拡張子はconf
[^2]: DocumentRootの所有者をapacheユーザーにすること

3. Apache の再起動 <br>`# service httpd restart`

### ***注意***

#### 「応答時間が長すぎます」とブラウザに表示される場合
* 内部から接続できるか確かめる<br>`$ curl URL:8080`
* 内部接続できたならば、CentOS のファイアウォールがポート番号に対して許可を与えていない可能性がある
* firewall にルールを追加 <br>`# firewall-cmd --zone=public --add-port=8080/tcp --permanent`
* リロード<br>`# firewall-cmd --reload`
* firewall 確認
```
# firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3
  sources:
  services: ssh dhcpv6-client http https
  ports: 8080/tcp
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```

#### ファイルやディレクトリの所有者を変更する
`chown 所有者or所有者:グループ ファイルorディレクトリ`

例）`chown apache:apache DocumentRootディレクトリ`

---
### 参考
[バーチャルホストの例](https://httpd.apache.org/docs/2.4/ja/vhosts/examples.html)<br>
[ApacheのVirtualHostってなんだ](https://qiita.com/monaky/items/b5f589e59ee002a1d355)<br>
[Apache HTTP Server（httpd）のポート番号を変更する方法](https://www.toyo104-memo.com/entry/httpd-port-modify)<br>
[たぶん難しくないApache2・初期設定編その１](https://piro791.blog.ss-blog.jp/2009-11-20-1)<br>
[サーバ名とポート番号(ServerName, Listen)](https://www.adminweb.jp/apache/ini/index3.html)<br>
[80番以外のポート番号を使用した場合のWebサーバへのアクセス](https://www.adminweb.jp/apache/install/index6.html)<br>
[ファイアウォール設定](https://qiita.com/inakadegaebal/items/14b2884389712e89b4a6)<br>
[応答時間が長すぎます問題](https://teratail.com/questions/35290)<br>
[ファイル権限コマンド](https://qiita.com/t-a-run/items/239ed690ece7a011804a)<br>
[Apache 2.4 設定ファイルの記述例](https://qiita.com/100/items/ab31e57fcc66ac661d5c)<br>

