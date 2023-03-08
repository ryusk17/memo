# Python

## 関数の引数リストにあるスラッシュ (/) は何を意味しますか？
引数リストの末尾にスラッシュは、この2つの仮引数が両方とも位置専用引数であることを意味します
https://docs.python.org/ja/3/faq/programming.html#what-does-the-slash-in-the-parameter-list-of-a-function-mean

## 参考
[文字列メソッド](https://docs.python.org/ja/3/library/stdtypes.html#string-methods)
[数値メソッド](https://docs.python.org/ja/3/library/stdtypes.html#additional-methods-on-integer-types)

## フォーマッター
### black
- Ubuntu
pip install black

- VS Code setting.json
  "python.formatting.provider": "black",
  "[python]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true
  },
  "emmet.includeLanguages": {
    "django-html": "html"
  },
  "python.formatting.blackArgs": ["--skip-string-normalization"],
