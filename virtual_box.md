ちなみに、VirtualboxのDISK容量を増やしたいのであれば
http://blog.kondoyoshiyuki.com/2019/12/19/expand-disk-space-virtualbox-ubuntu/
ここのステップ１で、DISKの容量自体を増やします。
次に、
GPartedのISOをダウンロードして、VirtualboxのCDドライブにISOファイルをセット
Virtualboxを起動させて、GPartedで対象のパーティションのサイズを拡張
---の環境だとsda2
その後、適用して終了し、再起動させると容量が拡張された状態になっている。
これが最もシンプルで簡単な拡張方法
このやり方は仮想環境がWindowsでも同じ

https://www.milkmemo.com/entry/gparted_win


## 有線接続時ipアドレス確認
無線切って有線接続 ※virtual box 起動していた場合再起動

$ ip add

設定 > ネットワーク > 名前 ※割り当て:ブリッジアダプター
有線・無線で設定する名前を使い分ける

有線時の接続中のネットワーク確認
windows: コントロール パネル\ネットワークとインターネット\ネットワーク接続
