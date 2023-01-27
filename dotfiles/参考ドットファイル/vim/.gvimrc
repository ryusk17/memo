
" _gvimrc基本設定 {{{
if has('vim_starting')
  " gvim起動時にのみ設定する
  colorscheme mydefault
  syntax enable
endif

" 行間隔の設定
set linespace=0

" 縦幅　デフォルトは24
set lines=45

" 横幅　デフォルトは80
set columns=210

set laststatus=2
" コマンドラインの高さ
set cmdheight=2

" ===Gvim用 === {{{

"ツールバーを非表示
set guioptions-=T

"メニューを非表示
set guioptions-=m
"
" gVimでもテキストベースのタブページを使う
set guioptions-=e

" フォントの設定はvimrcでおこなう
" フォント名に日本語名を使うので、一時的に文字コードを変える
setlocal fileencoding=iso-2022-jp
setlocal encoding=utf-8
if has('unix')
  set guifont=ゆたぽん（コーディング）Bold\ 11
else
  set guifont=ゆたぽん（コーディング）:h14:cSHIFTJIS
endif
setlocal encoding=utf-8
setlocal fileencoding=utf-8
"}}}

" }}}

" vim: foldmethod=marker
