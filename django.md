# django

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
