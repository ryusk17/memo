# android

## アプリから他アプリ起動
https://qiita.com/xu1718191411/items/25faefe055ebb315d041
```
String packageName = "com.android.vending";
        String className = "com.android.vending.AssetBrowserActivity";

        Intent intent = new Intent();
        intent.setClassName(packageName, className);

        startActivity(intent);
```

## build.properties に定義した値をappから参照する
1. build.properties に値を定義
```
EXAMPLE_VALUE=1234567890
```

2. build.gradle:app で値を代入
```
android {
~~~

    buildTypes {
        debug {
            buildConfigField "String", "EXAMPLE_VALUE", "\"${project.property("EXAMPLE_VALUE")}\""
        }
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
            buildConfigField "String", "EXAMPLE_VALUE", "\"${project.property("EXAMPLE_VALUE")}\""
        }
    }

~~~
}
```

3. 一度ビルドする BuileConfig.java を生成or追記するため
Build > Clean Project -> Build > Rebuild Project
4. MainActivity.java で値を取得
```
String exampleValue = BuildConfig.EXAMPLE_VALUE;
```
5. .gitignore に build.properties を追記

## WebViewとCookieを扱う
- Cookie 設定
```
  CookieManager cookieManager = CookieManager.getInstance();
        cookieManager.setAcceptCookie(true);
        cookieManager.setCookie(_URL_, "key=value;");
        cookieManager.setAcceptThirdPartyCookies(webViewJoin, true);
        cookieManager.flush();
```

- Cookie 取得
```
        webViewJoin.setWebViewClient(new WebViewClient() {

            @Override
            public void onPageFinished(WebView view, String url) {
                String[] cookies = CookieManager.getInstance().getCookie(url).split(";");
                for(String cookie : cookies){
                    Log.e("finish", cookie);
                }
            }
```

## Dialog
- デフォルトのtheme: Theme.MaterialComponents.Light.Dialog.Alert

- 全てのalertDialogにスタイルを反映する場合
``` themes.xml
<item name="alertDialogTheme">@style/hogeHogeDialogStyle</item>
```

## aapt2
- パッケージ名取得
/c/Users/_ユーザー名_/AppData/Local/Android/Sdk/build-tools/32.0.0/aapt2.exe dump packagename _hoge_.apk

## 実機にてPDFダウンロードした際のダウンロードファイルの確認
設定 > ストレージ > ファイル > Download
