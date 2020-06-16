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
