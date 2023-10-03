# docker

## 不具合時
https://github.com/docker/for-win/issues/9972#issuecomment-787076492
※コマンドプロンプト管理者権限
1. close Docker Desktop
2. restart Ubuntu through services.msc or this command (you can put in bat):
`net stop LxssManager && net start LxssManager`
3. start Docker again

https://qiita.com/kat_log/items/030847cf45728b5f414e
1. powershellを管理者で起動
2. コマンド& "C:\Program Files\Docker\Docker\DockerCli.exe" -SwitchDaemonを2回実行

## mysql
https://zenn.dev/gki/scraps/4231ff2ed5601c
- mysqlのdockerを使う時にDB初期化したい時はsh/sqlを/docker-entrypoint-initdb.d配下に置く
- 名前付きvolumeをdocker-composeで設定し、コンテナの/var/lib/mysqlに紐づける
- 起動時は普通にdocker-compose upを使う
- 普段のコンテナ停止はdocker-compose downを使う
- /docker-entrypoint-initdb.dのスクリプトを再実行したくなったら、docker-compose down --volumeを使う。名前付きボリュームが消えてDBが完全初期化されるので注意
- 再度 upすれば/docker-entrypoint-initdb.dのスクリプトが実行される

## DockerDesktopWindows の再インストール
- PowerShellでubuntu(wsl)のSTATEがStoppedか確認
PS C:\Users\narieda> wsl -l -v
  NAME      STATE           VERSION
* Ubuntu    Stopped         2

- Stoppedにする
PS C:\Users\narieda> wsl -t ubuntu
この操作を正しく終了しました。

- Windowsの「アプリと機能」からDockerDesktopをアンインストール
- 再度インストールする

## Docker failed to initialize の対処方法
C:\Users\{ユーザ名}\AppData\Roaming\Docker のフォルダを削除する
