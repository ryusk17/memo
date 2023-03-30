# Laravel

## バリデーションエラーメッセージ表示
```
@foreach ($errors->all() as $error)
  <li>{{$error}}</li>
@endforeach
```

## composer install でライブラリが上手く読み込めない
https://nextat.co.jp/staff/archives/193
- class再読み込み
composer dump-autoload

## composerについて
https://qiita.com/akira-hagi/items/553da1e122f7c300d6ac
| コマンド         | composer.lock | 動作                                               |
| :--------------- | :------------ | :------------------------------------------------- |
| composer install | あり          | composer.lockを元にインストール                    |
| composer install | なし          | composer.jsonを元にインストール・composer.lock生成 |
| composer update  | あり          | composer.jsonを元にアップデート・composer.lock更新 |
| composer update  | なし          | composer.jsonを元にアップデート・composer.lock生成 |

## 二重送信防止
`$request->session()->regenerateToken();`

## ページネーション設定
https://readouble.com/laravel/8.x/ja/pagination.html

Bootstrapの使用
Laravelは、Bootstrap CSSを使用して構築したペジネーションビューも用意しています。デフォルトのTailwindビューの代わりにこれらのビューを使用するには、App\Providers\AppServiceProviderクラスのbootメソッド内でペジネータのuseBootstrapメソッドを呼び出してください。

use Illuminate\Pagination\Paginator;

/**
 * 全アプリケーションサービスの初期起動処理
 *
 * @return void
 */
public function boot()
{
    Paginator::useBootstrap();
}

## マイグレーション
- マイグレーションファイル作成
php artisan make:migration ファイル名 --table=テーブル名
