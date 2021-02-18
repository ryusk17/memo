## コマンド
- shutdown -h now (シャットダウン)
- Ctrl + C (強制的に抜ける)
- ip a (IPアドレス)
- jq

## 構文チェックコマンド
- HTML
  - style直指定
    >`grep -r 'style="' . | grep -v '/assets/'`

- CSS
  - ダブルクォーテーション
    >`grep -r '"' --include='*.css' . | grep -v 'assets/'`
  - プロパティ名:後の空白無し
    >`grep -r '[a-z]:[^ ]' --include='*.css' . | grep -v '[{,]' | grep -v 'assets/'`

- PHP, JS
  - 関数の引数 ダブルクォーテーション囲み
    >`grep -rE '[a-zA-Z0-9_]+\("' --include='*.php' --include='*.js' . | grep -v 'assets/'`
  - 連想配列のkey ダブルクォーテーション囲み
    >`grep -rE '\$[a-zA-Z0-9_]+\[["]' --include='*.php' --include='*.js' . | grep -v 'assets/'`
  - 命名規則に沿っていないPHP変数名
    >`rep -rn -e '\$[a-z]*[_-]\(!GET\)' -e '\$[A-Z]' -e '\$[a-z]*[A-Z]\{2\}' --include='*.php' .`

## alias 作成
- vim /home/_USER_/.bashrc
- エイリアスの記述 `alias hoge='cd /home/'`
- 再起動 `$ reboot` or 反映 `$ source _PATH_/.bashrc`
- `$ alias` 確認

## プロンプトの変更
- vim /home/_USER_/.bashrc
- 反映 `$ source _PATH_/.bashrc`

## 検索
`ag '検索ワード' --php --depth 30 --ignore-dir test --ignore-dir test2 検索場所`
