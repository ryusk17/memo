# Git
- ワークツリー -> インデックス(ステージング) -> リポジトリ
- インデックス (バージョン管理される)

|   自分のPC   |         Git管理下         |
| :----------: | :-----------------------: |
| ワークツリー | インデックス > リポジトリ |

## branch 作成
- checkout -b newBranchName (枝を作成し、その枝に移動)
> 枝は親から子へつながるように切る
> 良い例）master > staging > develop > feature/~
> 悪い例）develop < master > staging (一つの枝から理由なく何本も派生するのはあまり良くない)

## branch 変更
- リモートに存在する別の枝に移動したい
  - checkout 別枝
  - 存在しませんとなる場合
    - pull origin どの枝でも可 (リモートをローカルに反映させる)(親の枝を pull するのが吉 ex. pull origin develop)
- ブランチ変更時、現在のステージングが邪魔する
  - checkout, restore によって回避
    - 回避できない場合
      - 適当なメッセージでコミットを行う(push は絶対にしないこと)
      - 別の枝に移動し、回避できなかった枝を削除する
      - もう一度削除した枝と同名の枝を作成し、リモートから pull する (ステージングする前の枝に戻る)

- fetch してからブランチを変えるのが吉

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
- status / branch (確認してから始める) (rebase 先にマージされていないプッシュが残っていないか)
- checkout 対象枝 (枝を変える) ex. checkout develop
- (branch) (確認！)
- pull origin branchName (更新) ex. pull origin develop
- checkout 自分枝 () ex. checkout myBranch
- (branch)
- rebase 対象枝 (取り込む) ex. rebase develop
- log (取り込まれているか確認)
- (push origin branchName (リモートブランチの更新))

## stash

## tips
- 作業を戻したい
  - status (変更の確認)
  - checkout ファイルパス (変更前に戻す)
- コミット取り消し
  - reset --soft HEAD^ (先頭コミットの取り消し)
- add . と -u
  - . (すべてのファイル・ディレクトリ)
  - -u (インデックス上にある(バージョン管理されている)ファイルの変更だけ add する)

## empty ファイルの意義
- 空フォルダを git 上にあげるために必要
- 空のままだとフォルダごと無視される

## 注意事項
- シンボリックリンクは commit しない (各環境に左右されるため)

## alias 作成
- vim ~/.gitconfig に追記

## log
- ツリー表示
  - 例）`$ git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative` (alias にした方が吉)

## tig
プラグイン

## 開発フロー
### GitFeatureFlow

master -> feature: 開発
master -> staging: 検証

1. feature -> staging: 検証環境にて動作確認
2. feature -> master: 本番環境反映


## branch 削除
マージ済みのローカルやリモートのブランチを一括削除するコマンド

ローカル側のコマンドは他人のPRをたくさん確認する人は便利かもしれません。
リモート側のコマンドは完全に管理者向けです。基本は使わないかもしれませんが、マージした後ブランチを削除してない運用でたまってしまったブランチを削除するのに使えるかなと思います。（このコマンドで200近くのマージ済みブランチを一括削除しました）

### developマージ済みのローカルブランチを一括削除する
#### 確認用
git branch --merged origin/develop | grep -v -e master -e develop -e staging
#### 実行
git branch --merged origin/develop | grep -v -e master -e develop -e staging | xargs -I% git branch -d %
### developにマージ済みのリモートブランチを一括削除する
#### 確認用 git branch -r --merged origin/develop | grep -v -e master -e develop -e staging | sed -e 's% *origin/%%'
#### 実行用
git branch -r --merged origin/develop | grep -v -e master -e develop -e staging | sed -e 's% *origin/%%' | xargs -I% git push --delete origin %

以下のgistを参考にしました。
https://gist.github.com/miukoba/fc3c10a25c1c675c1e97

他参考：https://zenn.dev/nrikiji/articles/25c11286121ad6

## 削除されたリモートブランチのリモート追跡参照が削除
git fetch -p

## 参考
https://qiita.com/dp-kihara/items/fe4361712ecf3788ccf1
