" vim:set expandtab tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=marker:
autocmd!
filetype plugin indent on
syntax enable

source ~/.config/nvim/conf/00-init.vim
source ~/.config/nvim/conf/01-set.vim
source ~/.config/nvim/conf/02-plugins.vim
source ~/.config/nvim/conf/03-functions.vim
source ~/.config/nvim/conf/04-mappings.vim

au BufNewFile,BufRead *.jbuilder set filetype=ruby

" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

" ファイルを開いた際の現在地復元
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let mapleader = "\<Space>"
colorscheme NeoSolarized


set tags=/var/www/html/sites/tact/app/src/tags
set tabstop=4 softtabstop=4 shiftwidth=4

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:rufo_auto_formatting = 1

function! s:formatter()
  :'<,'>s/ .*{/: {/g
  :'<,'>s/},//g
  :'<,'>s/{//g
endfunction
vnoremap <silent> <Space>t :<C-u>call <SID>formatter()<Cr>

let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:vimrubocop_config = '/var/www/html/sites/rand/yama/.rubocop.yml'
