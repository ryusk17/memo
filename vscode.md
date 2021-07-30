## ショートカット
- Shift + Alt + F (フォーマット(オートフォーマットではない際))
- Ctrl + Shift + L (選択部分の全マッチを選択)
- Ctrl + Home (+ Fn) (ファイルの先頭に移動)
- Ctrl + , (設定)
- Ctrl + Space (サジェスト表示)
- Ctrl + G (指定行へ移動)
- Ctrl + P (指定ファイルに移動)
- Ctrl + Tab (ファイル履歴を表示)
- Ctrl + ￥ (画面分割)

## 検索・置換
- 正規表現を使用 (.* をクリック)

```
改行挿入
\}\n\. -> }\n\n.

.a {

}
.b {

}

↓

.a {

}
改行
.b {

}

アンスコをハイフンに
- 先頭クラス (画像等と差別化)
class="([a-zA-z0-9]*)_([a-zA-z0-9]) -> class="$1-$2

class="abc_xyz -> class="abc-xyz

- 真ん中クラス (関数等と差別化)
\s([a-zA-z0-9]*)_([a-zA-z0-9]*)\s -> {半角スペース}$1-$2{半角スペース}

- 最後尾クラス
\s([a-zA-z0-9]*)_([a-zA-z0-9]*)" -> {半角スペース}$1-$2"

```

- 全角文字
[^\x01-\x7E] ※半角文字以外

- 日本語
[ぁ-んァ-ヶｱ-ﾝﾞﾟ一-龠]

- 正規表現参考記事
  - https://arc-tech.hatenablog.com/entry/2021/01/20/105620
  - https://so-zou.jp/software/tech/programming/tech/regular-expression/meta-character/variable-width-encoding.htm

## settings
- color https://code.visualstudio.com/api/references/theme-color
  - "workbench.colorTheme": "Solarized Light",

## インデント
ファイル全部折りたたみ
Ctrl + K → Ctrl + 0

ファイル全部展開
Ctrl + K → Ctrl + J

カレント全部折りたたみ
Ctrl + K → Ctrl + [

カレント全部展開
Ctrl + K → Ctrl + ]
