# android_studio

## デザインプレビューが表示されない
https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q10244516400
android:autofillHints="" と記述している場合、
android:autofillHints="no"と記述することで表示される

## Device File Explorer
https://akira-watson.com/android/file-sys.html
https://developer.android.com/studio/debug/device-file-explorer?hl=ja
[View] > [Tool Windows] > [Device File Explorer] をクリックするか、ツール ウィンドウ バーにある Device File Explorer アイコン  をクリックして、Device File Explorer を開きます

## 突然Cannot Resolve symbolで赤線が大量に出る時の対処法
https://tm23forest.com/contents/androidstudio-cannot-resolve-symbol
File -> 'Invalidate Caches / Restart'
これで直らない場合にはまずFile->Close Projectでプロジェクトを閉じてから開きなおす。
ここで、開きなおすときに最近開いたプロジェクトのところから開くのではなく'Open an exsiting Android Studio project'から対象とするプロジェクトを指定して開くのがポイント.

## APK

### 注意事項
buildTypes = debug or release を選択
apk したものを実機で確認すること
バージョン更新すること

### 初書き出し
1. OSにadb環境を導入 (https://windroid.work/2020/04/adb-windows-android-2020.html/)
2. Android Studio: 上部ナビバーBuild > Generate Signed Bundle or Apk
3. APK を選択し NEXT
4. Key store path をCREATE NEW
5. Key store path ex.) C:\android_key_store\myapplication_key_store.jks ※絶対になくさないこと
6. Password ex.) Yx3TgaCCvbvK ※忘れないこと
7. Alias ex.) myapplication_alias ※忘れないこと
8. その他項目を適宜入力し OK
9. Remember passwords チェックし NEXT
10. release を選択し FINISH
11. 生成後、Android Studio右下にAPK関連の「i」ボックスが出現
12. ボックスを全表示し locate クリック
13. apkファイル名は自由に変更可能 ex.)C:\Users\_USER_\AndroidStudioProjects\_myapplication_\app\release\myapplication_v1_0.apk

### インストール
- Windows
1. コマンドプロンプトを開く
2. `adb install _APK_FILE_` apkファイルはドラッグアンドドロップが吉 ※エラーの際は実機のインストール済アプリを削除
3. 実機で確認

## SVG -> XML
1. res > drawable 右クリック
2. New > Vector Asset
3. Asset Type: Local file でファイルを選択しNEXT
4. FINISH

## バージョン情報の調べ方
- android_studio
"about" で検索

- build.gradle :project
例）
classpath "com.android.tools.build:gradle:7.0.4"

- build.gradle :app
例）
compileSdk 32

applicationId "com.yep.anywhereapplication"
minSdk 29
targetSdk 32
versionCode 1
versionName "1.0"

## バージョン変更
build.gradle
versionCode
versionName

を更新の際、変更する
- vesionCode
  - 一律1ずつあげる
  - APK書き出しがdebug, release共に上げる(アンインストールせずにインストールできる)
- vesionName
  - 微修正: 1.0.1、修正・追加機能: 1.1、メジャーアップデート: 2.0
  - APK書き出しがreleaseの場合のみ更新

## アイコン画像設定
android > app > res > mipmap を open in エクスプローラーで開く
画像名を ic_launcher.拡張子 として配置
