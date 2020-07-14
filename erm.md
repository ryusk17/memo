## ER Master
- 右クリック
  - 表示 -> ビューモード (論理名表示)
  - エクスポート -> DDL (SQL)
- テーブル情報
  - 固有の設定
    - ストレートエンジン (InnoDB)
    - 文字セット (utf8mb4)
    - 照合順序 (utf8mb4_general_ci)
- 備考
  - sqlをエクスポートする際に、「コメントに使用する値」の「論理名：説明」を指定して出力

## テーブル設計
- date, datetime型は not null 制約をつけない (created, modified は除く)
