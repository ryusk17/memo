" augroup PHP
"   autocmd!
"   autocmd FileType php set makeprg=php\ -l\ %
"   " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
"   autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
" augroup END

let $PHP_MAKE_COMMAND = "php -l %"
set makeprg=$PHP_MAKE_COMMAND
setlocal foldmethod=syntax

" ターミナルだとなぜか一行出力された後に表示がずれるのでコメントアウト
"augroup PHP
"  autocmd!
"  " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
"  autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
"augroup END

