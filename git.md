# Git
- ワークツリー -> インデックス(ステージング) -> リポジトリ
- インデックス (バージョン管理される)

|   自分のPC   |         Git管理下         |
| :----------: | :-----------------------: |
| ワークツリー | インデックス > リポジトリ |

## branch 作成
- checkout -b branchName (枝を作成し、その枝に移動)
> 枝は親から子へつながるように切る
> 良い例）master > staging > develop > feature/~
> 悪い例）develop < master > staging (一つの枝から理由なく何本も派生するのはあまり良くない)


## push
- branch (枝の確認)
- status (状態確認)
- (diff)
- add -u  (間違えた場合は修正後もう一度 add することで上書きできる)(基本的には -u を用いる)
(- add . ("." すべてのファイル・ディレクトリ))
- (diff --staged)
- commit (-m '') (コミットメッセージ vim / -m オプションにて記載)(複数コミットをためておくことができる(１コミット１プッシュではない))
- push origin branchName (origin branchName を正確に指定)(未プッシュのコミットすべてがプッシュされる)

- diff (差分確認)
- log (ログ)

## rebase
- status / branch (確認してから始める)
- checkout 対象枝 (枝を変える)
- (branch) (確認！)
- pull origin branchName (更新)
- checkout 自分枝 ()
- (branch)
- rebase 対象枝 (取り込む)
- log (取り込まれているか確認)
- (push origin branchName (リモートブランチの更新))

## stash

## tips
- 作業を戻したい
  - status (変更の確認)
  - checkout ファイルパス (変更前に戻す)
- add . と -u
  - . (すべてのファイル・ディレクトリ)
  - -u (インデックス上にある(バージョン管理されている)ファイルの変更だけ add する)

## empty ファイルの意義
- 空フォルダを git 上にあげるために必要
- 空のままだとフォルダごと無視される


