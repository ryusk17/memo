# プログラミングする上で

C:\Users\narieda\Desktop\MyPHP\banana\README.md

* 疎結合 > 密結合
* MarkDown 記法

## PHP tips
```php
<?php
fuction makeHtml()
{?>
    関数内に html を自由に書ける
<?php}
```
[HTMLからの脱出](https://www.php.net/manual/ja/language.basic-syntax.phpmode.php) <br>
[PHPの関数でHTMLを出力する方法](https://q-az.net/php-function-html-output/)

## 関数とは

さて、以下は再帰関数の例ですが、`$count--`は何故書かれているのでしょうか？

```php
function test()
{
    static $count = 0;
    echo $count;
    $count++;
    if ($count < 10) {
        test();
    }
    $count--;
}
```

正解 : 二度目以降の呼び出しにおいても同じ挙動をするため

これが関数のあるべき姿！いつ何時であろうと常に同じく結果を！！

## 命名
[美しい名前](https://r-west.hatenablog.com/entry/20090510/1241962864)

DocumentRoot "/var/www/html"

