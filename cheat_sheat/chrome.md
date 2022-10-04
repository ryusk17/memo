# chrome

## short cut
| Command                      | Windows          | Mac                  |
| :--------------------------- | :--------------- | :------------------- |
| タブを開く                   | Ctrl + t         |
| タブを移動                   | Ctrl + Tab       |
| タブを指定し移動                   | Ctrl + N(1, 2..)       |
| 新規ウインドウを開く         | Ctrl + n         |
| シークレットウインドウを開く | Ctrl + Shift + n |
| 一度閉じたタブを再度開く     | Ctrl + Shift + t |
| ウインドウを閉じる           | Alt + F4         | Command + Shift + w  |
| アドレスバーにカーソル移動   | Ctrl + l         |
| HTMLソースを開く             | Ctrl + u         | Command + Option + u |
| DLページを開く               | Ctrl + j         | Command + Shift + j  |
| 検索バーの検索結果移動       | Ctrl + g         | Command + g          |
| 検索ボックスに移動           | /                |

## tips

### 検索エンジンの設定追加
- chrome://settings/searchEngines を検索
- その他検索エンジンの「追加」

例）https://qiita.com/dodonki1223/items/955819806297ee554b31
検索エンジン：日本語以外の検索
キーワード：nj
URL：javascript: (function () {   window.open(     `https://www.google.co.jp/search?q=${decodeURIComponent("%s")}&lr=-lang_ja`   ); })();
