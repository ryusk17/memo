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

## 改行コード一括置換
`find . -name "*.html" -type f -exec sed -i -e "s/\r//g" {} \;`
https://blog.logical-dice.com/articles/2020/08/05/replace-with-find-sed

CRLFはWindows等でよく使われる改行コードで、LFやLinuxやUnix等でよく使われる改行コードです。
まず、findコマンドの構成は以下の通り。

`find {検索対象ディレクトリ} -name {検索対象の名前} -type {検索対象のタイプ} -exec {検索対象に対して実施するコマンド}`
-type fでファイルを対象にしています。
-name "*.php"でphpファイルを指定しているのでタイプは指定する必要が内容に思えますが、
やろうと思えばhoge.phpというディレクトリも作れない訳ではないので、念の為指定しています。

そして、-execオプションでsedコマンドを指定しています。
sedコマンドの構成は以下の通り。

`sed -i -e "s/{置換対象の文字列}/{置換後の文字列}/g" 対象ファイル`
CRLFをLFに置換すると言いましたが、このコマンドでは正確にはCR(\r)を消しているだけです。
なので、CRLFはLFになりますし、もしCRがあれば消滅します。
(古いMacintoshではCRを改行コードとして扱っていたらしい。とりあえず現在では消滅してくれて良い。)

findの-execで実行する場合、{}に検索結果のファイル名が入ります。
そして実行したいコマンドの最後は\で閉じます。


## chmod
[ファイルまたはディレクトリのみへのchmodコマンド](http://www.tec-q.com/note/2007/11/_chmod.html)

### ファイルの場合
- find . -type f -print | xargs chmod 664

### ディレクトリの場合
- find . -type d -print | xargs chmod 775
