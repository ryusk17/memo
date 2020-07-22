# CakePHP3

## MVCについての参考記事
https://se-shine.net/what-mvc/
https://qiita.com/morikuma709/items/3e7964482414666672c8
https://tsuyopon.xyz/2019/02/21/what-is-the-mvc/

## CakePHP3のチュートリアル
### コンテンツ管理チュートリアル
https://book.cakephp.org/3/ja/tutorials-and-examples/cms/installation.html

### ブックマークチュートリアル
https://book.cakephp.org/3/ja/tutorials-and-examples/bookmarks/intro.html

### ブログチュートリアル
https://book.cakephp.org/3/ja/tutorials-and-examples/blog/blog.html


## PHP CS のエラー
php.ini の ;extension=intl の ; を外す

## ファイル構成 PHP3.8
- doc/
  - schema/
    - ~.erm
    - ~.sql
- src/
  - config/
    - .env
    - .env.default
    - app.php
    - bootstrap.php
    - const.php (定数定義 (案件による))
    - routes.php (ルーティング設定)
  - src/
    - Controller/
    - Model/
      - Entity/
      - Table/
        - ~Table.php (バリデーション)
    - Template/
      - Element/
        - header_menu.ctp (ヘッダー)
        - side_menu.ctp (サイドバー)
      - {tableName}/
        - add.ctp
        - edit.ctp
        - index.ctp
        - view.ctp
      - Layout/
        - default.php (ヘッドタグ、CSS・JS読み込み等)
  - webroot/
    - assets/
    - css/
    - js/
  - .htaccess


## メソッド
- getAttribute()
  - 全てのルーティングパラメーターを配列として取得
  - `$params = $this->request->getAttribute('params');`
