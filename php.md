# PHP

## 関数
- String 関数
  - nl2br ( string $string [, bool $is_xhtml = TRUE ] ) : string
    - 改行文字の前に HTML の改行タグを挿入する
  - strcmp ( string $str1 , string $str2 ) : int
    - バイナリセーフな文字列比較
  - ltrim ( string $str [, string $character_mask ] ) : string
    - 文字列の最初から空白 (もしくはその他の文字) を取り除く

## 配列操作
- 文字列 -> 配列
  - スペース処理 (https://qiita.com/fallout/items/a13cebb07015d421fde3) (https://qiita.com/mpyw/items/a704cb900dfda0fc0331)

## php.ini反映
https://mebee.info/2021/06/25/post-37228/
どこのphp.iniを設定するか確認: Loaded Configuration File
sudo systemctl restart httpd
sudo systemctl restart php81-php-fpm
