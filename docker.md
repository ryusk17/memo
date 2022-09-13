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
