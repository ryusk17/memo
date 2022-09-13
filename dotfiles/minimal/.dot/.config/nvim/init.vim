inoremap <silent> jj <Esc>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" filetype plugin on
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" set number
set cursorline
" set smartindent
" set background=dark
set showmatch matchtime=1
set showcmd
set display=lastline
" set list
set virtualedit=onemore
set nrformats=
" set ambiwidth=double
" set expandtab
" set tabstop=4
" set shiftwidth=4
set ignorecase          " 大文字/小文字を区別しない
set wildignorecase      " ディレクトリの大文字/小文字を区別しない
set smartcase           " ignorecase時大文字が混じったら大文字小文字を区別
set matchpairs+=<:>     " <>にもマッチするようにする
set title
set shortmess-=S        " 検索結果数表示
set updatetime=100
set virtualedit=onemore " カーソルを行末の一つ先まで移動可能にする
" set t_Co=256
set termguicolors
set clipboard=unnamed

