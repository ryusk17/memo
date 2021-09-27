## ショートカット
- Ctrl + 矢印キー (一気に移動)
- Ctrl + Shift + 矢印キー (一気に選択)
- F4 (絶対参照・相対参照変換)
- Alt + Enter (改行)

## 空(null)判定
1. NULL, 0000-00-00 などの記入を置き換えで空白にする
2. =IF(A1="", "null", A1)

## 文字コード
- sjis-win

## 日時表記
- UnixTime 表記の際
  - 対象セルを選択し、ホームにて数値を「標準」→「短い日付形式」を選択 (対象セルのみの影響)
  - phpMyAdmin から取得する際は、エクスポートの「スプレッドシートを開く」選択し、対象データを excel へコピペ (推奨方法)

## VLOOKUP

## セル幅
- ホーム
- セル 書式
- 列の幅の自動調整

## 文字列を抽出

### 左から
ex. "_"より左
`=LEFT(R3,FIND("_",R3)-1)`

### 間から
ex. "_"の間
`=MID(R5,FIND("_",R5)+1,FIND("_",R5,FIND("_",R5)+1)-FIND("_",R5)-1)`
https://www.relief.jp/docs/excel-function-find-2nd-character.html

### 右から
ex. 右から"_"まで
`=RIGHT(R3,LEN(R3)-FIND("■",SUBSTITUTE(R3,"_","■",LEN(R3)-LEN(SUBSTITUTE(R3,"_","")))))`
