# Git

## push
- branch (枝の確認)
- status (状態確認)
- (diff)
- add . (ステージング、間違えた場合は修正後もう一度 add することで上書きできる)("." すべてのファイル・ディレクトリ)
- (diff --staged)
- commit ()
- push origin feature/narieda (origin branchName を正確に指定)

- diff (差分確認)
- log (ログ)

## rebase
- status / branch (確認してから始める)
- checkout 対象枝 (枝を変える)
- (branch) (確認！)
- pull (更新)
- checkout 自分枝 ()
- (branch)
- rebase 対象枝 (取り込む)
- log (取り込まれているか確認)

## tips
- 作業戻したい
  - status (変更ファイルの確認)
  - checkout ファイルパス ()

## empty ファイルの意義
- 空フォルダを git 上にあげるために必要
- 空のままだとフォルダごと無視される
