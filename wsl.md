# WSL

## 起動
Windowsの検索欄で「ubuntu」を検索すること

## shellの変更
https://terralien.hatenablog.com/entry/2022/03/09/012357
sudo apt install -y zsh
which zsh
#whichで出力したパスを/usr/bin/zshのところに
chsh -s /usr/bin/zsh ユーザー名

## WindowsからWSL2のディレクトリへ接続
エクスプローラーのアドレスバーに「\\wsl$」を入力する

## WSLバージョンの確認
コマンドプロンプト、PowerShellで
wsl -l -v
