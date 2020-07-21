## コマンド
- shutdown -h now (シャットダウン)
- Ctrl + C (強制的に抜ける)
- ip a (IPアドレス)

## 構文チェックコマンド
- HTML
  - style直指定
    >`grep -r 'style="' . | grep -v '/assets/'`

- CSS
  - ダブルクォーテーション
    >`grep -r '"' --include='*.css' . | grep -v 'assets/'`
  - プロパティ名:後の空白無し
    >`grep -r '[a-z]:[^ ]' --include='*.css' . | grep -v '[{,]' | grep -v 'assets/'`

- PHP、JS
  - 関数の引数 ダブルクォーテーション囲み
    >`grep -rE '[a-zA-Z0-9_]+\("' --include='*.php' --include='*.js' . | grep -v 'assets/'`
  - 連想配列のkey ダブルクォーテーション囲み
    >`grep -rE '\$[a-zA-Z0-9_]+\[["]' --include='*.php' --include='*.js' . | grep -v 'assets/'`
