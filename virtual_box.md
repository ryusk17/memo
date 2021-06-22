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
