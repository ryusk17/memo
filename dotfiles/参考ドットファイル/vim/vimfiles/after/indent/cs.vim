" Vim indent file
" Language:	C#

" if exists("b:did_indent")
"    finish
" endif
" let b:did_indent = 1

setlocal cindent

"タブ文字の幅
setlocal tabstop=4
"自動インデントの際に使う1レベル分のインデント量
setlocal shiftwidth=4
"タブ文字の代わりに挿入されるホワイトスペースの量
setlocal softtabstop=4
" タブをスペースに展開しない 
" expandtab:展開する
" noexpandtab:展開しない
setlocal expandtab

let b:undo_indent = 'setlocal '.join([
\   'cindent<',
\   'expandtab<',
\   'tabstop<',
\   'softtabstop<',
\   'shiftwidth<',
\ ])

