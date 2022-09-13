set number
set cursorline
set hlsearch
set incsearch
set smartindent
set laststatus=2
set wildmenu
syntax enable
set t_Co=256
set background=dark
"colorscheme gruvbox
"colorscheme everforest
set showmatch matchtime=1
set showcmd
set display=lastline
set list
set fenc=utf-8
set virtualedit=onemore
inoremap <silent> jj <Esc>
set nrformats=
set ambiwidth=double
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set nocompatible
filetype plugin on
filetype plugin indent on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> "再描画 + :noh
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase                                     "大文字/小文字を区別しない
set wildignorecase                                 "ディレクトリの大文字/小文字を区別しない
set smartcase                                      "ignorecase時大文字が混じったら大文字小文字を区別
set matchpairs+=<:>                                "<>にもマッチするようにする
set title
set hidden
set ttyfast
set clipboard=unnamed,unnamedplus,autoselect "https://vim-jp.org/vim-users-jp/2010/02/21/Hack-126.html
set shortmess-=S "検索結果数表示
set encoding=UTF-8
set updatetime=100
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set scrolloff=3
set belloff=all

" function
function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

