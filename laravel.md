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
