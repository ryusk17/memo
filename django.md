# django

## コマンド
- プロジェクト作成
django-admin startproject _プロジェクト名_ .
- アプリケーション作成
python manage.py startapp _アプリケーション名_

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
python manage.py runserver
の前に
python manage.py migrate
すること

## runserver 時に Error: That port is already in use.
https://qiita.com/taiyyytai/items/20239fa1baada477a52f
ps aux して kill する
