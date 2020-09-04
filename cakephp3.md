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
  - bin (cake コマンドが使える階層`./cake bake` 上の階層の場合(src/)：`bin/cake bake`)
    - cake
  - config/
    - .env
    - .env.default
    - app.php (webroot のパスなどの定数定義)
    - bootstrap.php (config/ を読み込み 初期設定のようなもの) *1
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
  - vender/ (根幹記述)
  - webroot/
    - assets/
    - css/
    - js/
  - .htaccess
  - composer.lock (plugin 記述)

*1
```
/*
 * Read configuration file and inject configuration into various
 * CakePHP classes.
 *
 * By default there is only one configuration file. It is often a good
 * idea to create multiple configuration files, and separate the configuration
 * that changes from configuration that does not. This makes deployment simpler.
 */
try {
    Configure::config('default', new PhpConfig());
    Configure::load('app', 'default', false);
    Configure::load('const'); ← config/ 内で定数定義ファイル(const.php)を作成した場合の読み込ませ方
} catch (\Exception $e) {
    exit($e->getMessage() . "\n");
}
```


## メソッド
- getAttribute()
  - 全てのルーティングパラメーターを配列として取得
  - `$params = $this->request->getAttribute('params');`

## データの扱い
- 最初の一件取得
  - $_TABLES->first()
- 日付のフォーマット (推奨)
  - $_ENTITY->i18nFormat('yyyy年M月d日')
- カラムの取得
  - $this->_TABLES->schema()->columns()

## bake コマンド
- bakeはcakeコマンドから実行しますが、cakeコマンドのパスは「[プロジェクトのパス]/bin」になります

## コレクション class Cake\Collection\Collection
https://book.cakephp.org/3/ja/core-libraries/collections.html
