# Vim

| Command                            | Keybinding               | 例     |
| :--------------------------------- | :----------------------- |
| 文(テキストオブジェクト)           | is                       |
| タグ(テキストオブジェクト)         | it                       |
| 括弧(テキストオブジェクト)         | i] ("",'',(),<>,{} など) |
| 一時的にシェルに戻りexitでviに戻る | :sh                      |
| コマンド結果挿入                   | :r! __command__          | :r!pwd |
| コマンドラインモードで貼り付け     | :C-r"                    |
| 全行をソートする                   | :%!sort                  |
| 選択した行をソートする             | V:!sort                  |
| 選択した行を逆順にする             | V:!tac                   |
| スマイル                           | :smile                   |
| 行頭の文字へ移動                   | _, ^                     |


## オフセット :help offset
/{検索キーワード}/{オフセット}<Enter> （下方向へ検索する）
?{検索キーワード}?{オフセット}<Enter> （上方向へ検索する）

| オフセット    | 実行内容                                                                      |
| :------------ | :---------------------------------------------------------------------------- |
| e e0          | マッチした検索キーワードの末尾へ移動する (endの略）                           |
| eN e+N        | マッチした検索キーワードの末尾からN文字右へ移動する (endの略）                |
| e-N           | マッチした検索キーワードの末尾からN文字左へ移動する (endの略）                |
| sN s+N bN b+N | マッチした検索キーワードの頭からN文字右へ移動する (start もしくは beginの略） |
| s-N b-N       | マッチした検索キーワードの頭からN文字左へ移動する (start もしくは beginの略） |
| N +N          | マッチした検索キーワードのN行下へ移動する                                     |
| -N            | マッチした検索キーワードのN行上へ移動する                                     |

## 参照
https://dev.classmethod.jp/articles/vim-use-shellcommands/
検索したキーワードの末尾に移動 https://vim.blue/search-offset/
