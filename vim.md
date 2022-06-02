# vim

## 操作
- Ctrl
  - d 半ページ進む
  - u 半ページ戻る
  - b １ページ進む
  - f １ページ戻る

## dein
- vim --version 8 以上必要
- プラグイン動作が不調
:call dein#recache_runtimepath()

## 参考
https://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation

## help

### help のみ開く
- :help 分からないこと | only
- help window で c-w o
- help window で c-w c

## swp 削除
find . -name '.*.sw*'|xargs rm
