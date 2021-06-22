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

## $this->Html->script
echo $this->Html->script('sample.js'); // その場所で出力するのでechoが必要
$this->Html->script('sample.js', ['block' => true]); // その場所で出力せずfetchのタイミングで出力されるのでechoはいらない

## バリデーション

https://qiita.com/azukiazusa/items/9e8bbe461bdbc7ee572c
メソッド名	説明
add	ルールを追加する
addNested	ネストされたデータをバリデートする
addNestedMany	1対多の関係をバリデートする
remove	ルールを削除する
requirePresence	フィールドに存在することを要求する。nullは許容する
allowEmpty	空を許容する。3.7から非推奨
notEmpty	空を認めない。フィールドに存在することは要求しない。3.7から非推奨
notBlank	空を認めず、更に半角スペースも認めない
allowEmptyString	空を許容し、かつ文字列か
notEmptyString	空を認めず、かつ文字列か
allowEmptyArray	空を許容し、かつ配列か
notEmptyArray	空を認めず、かつ配列
allowEmptyFile	空を許容し、かつファイルか
notEmptyFile	空を認めず、かつファイルか
allowEmptyDate	空を許容し、かつ日付型か
notEmptyDate	空を認めず、かつ日付型か
allowEmptyTime	空を許容し、かつ時刻か
notEmptyTime	空を認めず、かつ時刻か
allowEmptyDateTime	空を許容し、かつdatetime型か
notEmptyDateTime	空を認めず、かつdatetime型か
alphaNumeric	半角英数字か
lengthBetween	指定した文字数の範囲か
creditCard	クレジットカードの形式か
greaterThan	指定した数字を超えるか
greaterThenOrEqual	指定した数字以上
lessThen	指定した数字未満
lessThenOrEqual	指定した数字以下
equals	指定した数字と一致
notEquals	指定した数字と不一致
sameAs	指定したフィールドと一致（厳格な比較)
notSameAs	指定したフィールドと不一致(厳格な比較)
equalToField	指定したフィールドと一致
notEqualToField	指定したフィールドと一致
graterThenToField	指定したフォールドを超える
graterThenOrEqualToField	指定したフィールド以上
lessThenToField	指定したフィールド未満
lessThenOrEqualToField	指定したフィールド以下
containsNonAlphaNumeric	指定した回数英数字以外が含まれているか
date	ymd形式がどうか
datetime	datetime形式がどうか
time	時刻の形式かどうか
boolean	真偽値かどうか
decimal	十進数小数か
email	メールアドレス形式か
ip	IPアドレスの形式か
ip4	IPv4の形式か
ip6	IPv6の形式か
minLength	スカラ値が指定した文字数以下か
maxLength	スカラ値が指定した文字数以下か
minLengthBytes	スカラ値が指定したバイト数以下か
maxLengthBytes	スカラ値が指定したバイト数以下か
numeric	is_numericか
naturalNumber	自然数かどうか
nonNegativeInteger	0以上の自然数か
range	指定した範囲の数値か
url	urlの形式か
urlWithProtocol	urlの形式で、スキーマが必須
inList	リストの中に存在するか
uuid	uuidか
uploadedFile	ファイルの形式か
latLong	経度または緯度の形式か
latitude	経度か
longitude	緯度か
ascii	ASCII文字か
utf8	BMP UTF-8文字か
utf8Extended	UTF-8文字か
integer	数字か
isArray	配列か
isScaler	スカラ値か
hexColor	16進数カラーコードか
multipleOptions	複数選択セレクトボックスの値か
hasAtLeast	フィールドが指定された数以上の要素をもつか
hasAtMost	フィールドが指定された数以下の要素をもつか
regex	フィールドが正規表現に一致するか


## debug kit
強制表示
```
app.php
'DebugKit' => [
        'forceEnable' => true,
],
```
