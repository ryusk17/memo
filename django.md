# django

## コマンド
- プロジェクト作成
django-admin startproject _プロジェクト名_ .
- アプリケーション作成
python manage.py startapp _アプリケーション名_
- 管理ユーザー作成
python manage.py createsuperuser

## settings.py
- DBにMySQLを使用
```
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "_DB名_",
        "USER": "root",
        "PASSWORD": "",
        "HOST": "db",
        "PORT": "3306",
        "OPTIONS": {
            "init_command": "SET sql_mode='STRICT_TRANS_TABLES'",
        },
    }
}
```


## バックグラウンドでサーバー起動
&をつける
python manage.py runserver &
ジョブ終了：fgコマンドでフォアグラウンドに戻しCtrl-C

## MySQLにマイグレーションでWARNINGS
setting.pyに以下OPTIONSを追記
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'my_db',
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        },
    }
}
```
## Docker開発環境
初回は
python manage.py runserver 0.0.0.0:8000
の前に
python manage.py migrate
すること

## runserver 時に Error: That port is already in use.
https://qiita.com/taiyyytai/items/20239fa1baada477a52f
ps aux して kill する

## VSCodeでデバッグを行う方法
1. docker-compose up -d でdockerを立ち上げ
2. VSCodeの拡張機能「Dev Containers」をインストール
3. Ctrl + Shift + p で「open folder in container」を選択し、リポジトリを開く
4. 「Dev container: django cocntainer」にpythonの拡張機能をインストールする
5. ブレークポイントを設定
6. 「実行とデバッグ」で「Django container」が選択されていることを確認し、デバッグを実行
ブレークポイントが実行できていればok

## DB設計変更時
1. DROP DATABASE する
2. CREATE DATABASE する
3. python manage.py makemigrations app
4. python manage.py migrate

## 静的ファイル
python manage.py collectstatic
