" vim:set expandtab tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=marker:

set history=1000                                   "コマンド履歴
set completeopt-=preview
set backup                                         "Backup作成
set undodir=$HOME/.vim/tmp/undo
set backupdir=$HOME/.vim/tmp/backup/               "Backupディレクトリの指定
set viminfo='1000,<500,s10,h,n$HOME/.vim/tmp/viminfo
set swapfile                                       "Swap作成
set directory=$HOME/.vim/tmp/swap/                 "Swap作成ディレクトリの指定
set updatecount=100
set viewdir=$HOME/.vim/tmp/view/                   "view作成ディレクトリの指定
set notagbsearch                                   "Tagsの検索に効率の悪い線形探索を使用(HelptagsのVimバグ対応)
set ignorecase                                     "大文字/小文字を区別しない
set wildignorecase                                 "ディレクトリの大文字/小文字を区別しない
set smartcase                                      "ignorecase時大文字が混じったら大文字小文字を区別
set wrapscan                                       "最下部まで検索したら最初に戻る
set incsearch                                      "文字列入力中にマッチ文字列に自動移動
set hlsearch                                       "マッチ文字をハイライト表示
set grepprg=internal                               "GrepはVim標準を使用
set listchars=tab:>\ ,extends:<,trail:-            "非表示文字の表現
set list                                           "非表示文字の表示
set noruler                                        "カーソル行列の非表示
set wrap                                           "折り返し表示をしない
set title                                          "Windowタイトル表示
set cmdheight=2                                    "コマンドラインの行数
set laststatus=2                                   "ステータス行を常に表示
set scrolloff=3                                    "カーソル位置から上下は常に表示
set sidescrolloff=3                                "カーソル位置から上下は常に表示
"set showcmd                                       "入力コマンドを画面下部に表示
set display=uhex                                   "印字不可能文字を16進数で表示"
set imsearch=1
set iminsert=1
set nocursorline                                   "カーソル行をハイライト
set lazyredraw                                     "コマンド実行中は再描画しない
set t_Co=256                                       "256colors
set matchpairs+=<:>                                "<>にもマッチするようにする
set showtabline=2                                  "タブは常に表示
set equalalways                                    "Windowサイズ自動調整
set cpoptions-=m                                   "移動キーを押しても括弧の強調を有効にする
set matchtime=3                                    "移動キーを押しても括弧の強調を有効にする
set eadirection=both
set number                                         "行番号表示
set complete=.,w,b,u,t,i,k                         "補完候補設定
set wildmenu                                       "コマンドライン入力の補完
set wildmode=list:full
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set autoindent
set nohidden                                       "bufferをHiddenに
set virtualedit=all
set browsedir=current                              "browseコマンドで開く場合の相対パス
set whichwrap=b,s,h,l,<,>,[,]                      "行末から次の行へ移動できるように
set helplang=ja,en                                 "helpの優先順位
set linebreak                                      "単語レベルの折り返りを有効化
set nrformats-=octal                               "先頭0始まりでも10進数として扱う
"set clipboard+=autoselect                          "Visual選択した範囲をClipBoardに自動コピー
set more
set ttyfast                                        "高速ターミナル接続
set ambiwidth=double                               "□とか○の文字があってもカーソル位置がずれないようにする
set background=dark
set backspace=2
"set termencoding=&encoding
set autowrite
set formatoptions=qlromM   "折り返し設定
set shortmess+=s
" set binary
"set fixendofline
set noeol
set expandtab
"set termguicolors
set eol
