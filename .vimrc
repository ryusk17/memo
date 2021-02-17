set number
set cursorline
syntax enable
set hlsearch
set incsearch
set smartindent
set laststatus=2
set wildmenu
set background=dark
colorscheme gruvbox
set showmatch matchtime=1
set showcmd
set display=lastline
set fenc=utf-8
set virtualedit=onemore
inoremap <silent> jj <Esc>
"set list
set nrformats=
set ambiwidth=double
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set nocompatible
filetype plugin on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> "再描画 + :noh
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
set expandtab
set tabstop=4
set shiftwidth=4

" function
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
