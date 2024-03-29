" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

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

let mapleader="\<space>" " Leaderキー設定(デフォルト：バックスラッシュ)

"標準設定
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
colorscheme gruvbox
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
"set nohidden
set hidden
set ttyfast
set clipboard=unnamed,unnamedplus,autoselect "https://vim-jp.org/vim-users-jp/2010/02/21/Hack-126.html
"set clipboard=unnamedplus "https://qiita.com/koara-local/items/5ef4828e043a978205c3
"set clipboard&
"set clipboard^=unnamedplus
"source ~/.cache/src-vim/osc52.vim "https://tateren.hateblo.jp/entry/2017/07/21/213020
"vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
set shortmess-=S "検索結果数表示 

" function
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

"https://thinca.hatenablog.com/entry/20120208/1328676033
"文字列内で誤爆するため一旦削除

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"tagbar
nmap <F8> :TagbarToggle<CR>
nmap <Leader>t :TagbarOpen [f]<CR>

" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char} sneakプラグインもある
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"CtrlP
"let g:ctrlp_map = '<Leader>p'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_show_hidden = 1
nnoremap <silent> <Leader>p :<C-u>CtrlP<CR> 
nnoremap <silent> <Leader>b :<C-u>CtrlPBuffer<CR> 
nnoremap <silent> <Leader>r :<C-u>CtrlPMRUFiles<CR> 

"ctrlp-extentions.vim
nnoremap <silent> <Leader>y :<C-u>CtrlPYankring<CR> 

"emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"snipMate
let g:snipMate = { 'snippet_version' : 1 }
