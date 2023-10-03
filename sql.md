## Error Code 1336: 文字コードエラー
- そもそも MySQL の文字コード設定がおかしい可能性がある
- 文字コード確認 `mysql> show variables like "chara%";`
- ずれていた場合 /etc/my.cnf に設定記入 `# vim my.cnf`
```
例）utf8mb4 に統一する
character_set_client=utf8mb4
character_set_connection=utf8mb4
character_set_results=utf8mb4
```
- mysql 再起動後に確認 `mysql> show variables like "chara%";`
- 結果
+--------------------------+--------------------------------+
| Variable_name            | Value                          |
+--------------------------+--------------------------------+
| character_set_client     | utf8mb4                        |
| character_set_connection | utf8mb4                        |
| character_set_database   | utf8mb4                        |
| character_set_filesystem | binary                         |
| character_set_results    | utf8mb4                        |
| character_set_server     | utf8mb4                        |
| character_set_system     | utf8                           |
| character_sets_dir       | /usr/share/mysql-8.0/charsets/ |
+--------------------------+--------------------------------+

- mysql が起動しなくなる (ERROR 2002 (HY000): Can’t connect to local MySQL server through socket ‘/var/lib/mysql/mysql.sock’ (2))
  - 文字コード設定を消す(https://teratail.com/questions/141433)

## 外部キー制約を無視する
- `SET foreign_key_checks = 0;`(外部キー制約を外す)
- データ操作
- `SET foreign_key_checks = 1;`(外部キー制約を設定)

## EXPLAIN


## dump
https://qiita.com/PlanetMeron/items/3a41e14607a65bc9b60c

### 定義とデータのダンプ
```
# データベース
$ mysqldump -u USER_NAME -p -h HOST_NAME DB_NAME > OUTPUT_FILE_NAME

#テーブル
$ mysqldump -u USER_NAME -p -h HOST_NAME DB_NAME TABLE_NAME > OUTPUT_FILE_NAME

#テーブルの定義とデータのダンプ
$ mysqldump -u USER_NAME -p -h HOST_NAME -A -n > OUTPUT_FILE_NAME
```

## 自動連番のidカラムを後から追加する
`alter table テーブル名 add id int not null primary key auto_increment;`

## 外部キー制約とカラムの削除
https://www.takasay.com/entry/2016/07/08/172140

- テーブルの参照制約を確認
SHOW CREATE TABLE something\G
- CONSTRAINTの次に書いてある文字列を指定し外部キー制約の削除
ALTER TABLE something DROP FOREIGN KEY `xxxxx_xxxxx_xxxxx`;
- カラム削除
ALTER TABLE something DROP COLUMN another_id;

## テーブル変更
- 型変更
ALTER TABLE [テーブル名] MODIFY [カラム名] [型];
ALTER TABLE [テーブル名] MODIFY [カラム名] [型] NOT NULL;

- カラム削除
ALTER TABLE [テーブル名] DROP COLUMN [フィールド名];

## スロークエリ確認

- 設定確認
mysql> show variables like 'slow_query%';
+---------------------+-----------------------------------+
| Variable_name       | Value                             |
+---------------------+-----------------------------------+
| slow_query_log      | OFF                               |
| slow_query_log_file | /var/lib/mysql/localhost-slow.log |
+---------------------+-----------------------------------+
2 rows in set (0.00 sec)

mysql> show variables like 'long%';
+-----------------+-----------+
| Variable_name   | Value     |
+-----------------+-----------+
| long_query_time | 10.000000 |
+-----------------+-----------+
1 row in set (0.00 sec)

mysql> SHOW GLOBAL VARIABLES LIKE 'log_queries_not_using_indexes';
+-------------------------------+-------+
| Variable_name                 | Value |
+-------------------------------+-------+
| log_queries_not_using_indexes | OFF   |
+-------------------------------+-------+
1 row in set (0.00 sec)


- スロークエリ判定を3秒にする
mysql> set global long_query_time=3;
Query OK, 0 rows affected (0.00 sec)

- スロークエリログを出力する
mysql> set global slow_query_log=1;
Query OK, 0 rows affected (0.00 sec)

- インデックスの効かないクエリをスロークエリログに出力する
mysql> set global log_queries_not_using_indexes=1;
Query OK, 0 rows affected (0.00 sec)


## インデックス確認
mysql> SELECT table_schema, table_name, index_name, column_name, seq_in_index FROM information_schema.statistics WHERE table_schema = "DB名";
