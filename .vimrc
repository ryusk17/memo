" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

let g:airline_theme='fruit_punch'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

"標準設定
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
set spell
set spelllang=en,cjk
set ignorecase                                     "大文字/小文字を区別しない
set wildignorecase                                 "ディレクトリの大文字/小文字を区別しない
set smartcase                                      "ignorecase時大文字が混じったら大文字小文字を区別
set matchpairs+=<:>                                "<>にもマッチするようにする
set title
set nohidden
set ttyfast

" function
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
