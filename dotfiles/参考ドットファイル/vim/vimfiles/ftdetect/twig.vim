" 参考：http://blogaomu.com/2012/10/03/twig-syntax-highlight-on-vim
" TwigのシンタックスハイライトをVimに登録する
" http://www.vim.org/scripts/script.php?script_id=1856
" より、inja.vimとhtmljinja.vimをダウンロードし、~/.vim/syntaxディレクトリ等に格納しておく。
autocmd BufNewFile,BufRead *.twig setlocal filetype=htmljinja

