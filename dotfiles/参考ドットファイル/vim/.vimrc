set encoding=utf-8
scriptencoding utf-8

"vimrc参考URL
" [vimrcアンチパターン - rbtnn雑記](http://rbtnn.hateblo.jp/entry/2014/11/30/174749)
" [vimrc アンチパターンを自動でチェックする - Qiita](http://qiita.com/Kuniwak/items/407ab494281427847af0)

"エンコーディング関連は難しいね
" http://d.hatena.ne.jp/heavenshell/20080105/1199536148
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif

if has('vim_starting')
  " vim起動時にのみ設定する
  set runtimepath^=$HOME/vimfiles
  set runtimepath+=$HOME/vimfiles/after
  
  " 環境依存の設定を読み込む
  if has('unix')
    source $HOME/.vimrc_local_linux
  else 
    source $HOME/.vimrc_local_win
  endif
  syntax enable

  " == _vimrc基本設定 == {{{
  " " 縦幅　デフォルトは24
  " set lines=32
  " " 横幅　デフォルトは80
  " if has('unix')
  "   set columns=120
  " elseif has('win32') || has('win64')
  "   set columns=160
  " endif

"}}}

endif

" == プラグイン関連 == {{{
filetype plugin indent off

if has('vim_starting')

" gitのインストール確認。パスが通っていない場合もNG
if !executable('git')
  echo 'Please install git.'
  finish
endif

" neobundleがcloneされていない場合はcloneする {{{
" 参考：https://github.com/osyo-manga/cpp-vimrc/blob/master/vimrc
let s:neobundle_plugins_dir = $HOME . '/.vim/.bundle'
if !isdirectory(s:neobundle_plugins_dir . '/neobundle.vim')
  echo 'Please install neobundle.vim.'
  function! s:install_neobundle()
    if input('Install neobundle.vim? [Y/N] : ') == 'Y'
      if !isdirectory(s:neobundle_plugins_dir)
        call mkdir(s:neobundle_plugins_dir, 'p')
      endif

      execute '!git clone git://github.com/Shougo/neobundle.vim '
            \ . s:neobundle_plugins_dir . '/neobundle.vim'
      echo 'neobundle installed. Please restart vim.'
    else
      echo 'Canceled.'
    endif
  endfunction
  augroup install-neobundle
    autocmd!
    autocmd VimEnter * call s:install_neobundle()
  augroup END
  finish
endif
" }}}

"	" runtimepathの先頭に移動して優先度を上げる
"	set runtimepath^=~/.vim/
"	"コンパイラプラグインの場所を設定する
"	set runtimepath+=~/.vim/compiler
	" pathogenの位置を設定する
"TODO	set runtimepath+=~/_bundle_pathogen/vim-pathogen
	" neobundleの位置を設定する
	set runtimepath+=~/.vim/.bundle/neobundle.vim
	call neobundle#begin(expand('~/.vim/.bundle/'))
endif
" neobundleがプラグインを管理するフォルダを指定する

" NeoBundle管理のプラグイン登録 {{{

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-colorscheme'

" カーソル位置を基準とした、文脈から特定の filetype を判定する為のライブラリです。
NeoBundle 'https://github.com/Shougo/context_filetype.vim'

NeoBundle 'matchit.zip'
NeoBundle 'Align'
NeoBundle 'https://github.com/chumakd/BlockDiff.git', 'master'
" NeoBundle 'BlockDiff' " BlockDiffは改行コードなど修正されているchumakdさんがforkしているものを使う
NeoBundle 'ctags.vim'
" NeoBundle 'ShowMarks'
NeoBundle 'vimwiki'

NeoBundle 'https://github.com/LeafCage/foldCC.git'
NeoBundle 'https://github.com/kana/vim-altr.git'
NeoBundle 'https://github.com/easymotion/vim-easymotion.git'
NeoBundle 'https://github.com/haya14busa/vim-easyoperator-line'
NeoBundle 'https://github.com/kana/vim-smartchr.git'
NeoBundle 'https://github.com/t9md/vim-quickhl.git'
NeoBundle 'https://github.com/osyo-manga/vim-anzu.git'
NeoBundle 'https://github.com/itchyny/lightline.vim.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'https://github.com/tpope/vim-surround.git'
NeoBundle 'https://github.com/osyo-manga/unite-quickfix.git'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'vim-scripts/actionscript.vim--Leider'
" doxygenコメントを生成する :Dox でカーソル以下のメソッドに対応するコメントを生成してくれる
NeoBundle 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'

"unite関連
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/kmnk/vim-unite-giti.git'
NeoBundle 'https://github.com/Shougo/unite-build.git'

"textobj関連
" textobj関連のベースとなるプラグイン
NeoBundle 'https://github.com/kana/vim-textobj-user.git'
" http://d.hatena.ne.jp/h1mesuke/20111205
" NeoBundle 'https://github.com/rhysd/vim-textobj-wiw.git'
" コメント ac ic
NeoBundle 'https://github.com/thinca/vim-textobj-comment.git'
" 関数(C,Java,Vimscript) dif vif yaF yiF
NeoBundle 'https://github.com/kana/vim-textobj-function.git'
" 関数の引数 a, i,
NeoBundle 'https://github.com/sgur/vim-textobj-parameter.git'
" 1行 al il
NeoBundle 'https://github.com/kana/vim-textobj-line.git'

"Markdown関連
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'https://github.com/tyru/open-browser.vim.git'

" カラースキーム
NeoBundle 'tomasr/molokai'
NeoBundle 'https://github.com/guns/xterm-color-table.vim.git'

" Eclipseのプロパティを正常に表示させる
NeoBundle 'https://github.com/kamichidu/vim-edit-properties.git'

" htmlコーディング
NeoBundle 'mattn/emmet-vim'

" cakephp用
" http://blog.naberon.jp/post/2010/10/12/vim_cakehtml/
NeoBundle 'naberon/vim-cakehtml'

NeoBundle 'vim-syntastic/syntastic'

" TypeScript関連
" [VimでTypeScriptの補完などを有効にして快適にエディット出来るようにする設定 - タオルケット体操](http://hachibeechan.hateblo.jp/entry/2015/03/13/Vim%E3%81%A7TypeScript%E3%81%AE%E8%A3%9C%E5%AE%8C%E3%81%AA%E3%81%A9%E3%82%92%E6%9C%89%E5%8A%B9%E3%81%AB%E3%81%97%E3%81%A6%E5%BF%AB%E9%81%A9%E3%81%AB%E3%82%A8%E3%83%87%E3%82%A3%E3%83%83%E3%83%88)
NeoBundleLazy 'leafgarland/typescript-vim', {
\ 'autoload' : {
\   'filetypes' : ['typescript'] }
\}
NeoBundleLazy 'jason0x43/vim-js-indent', {
\ 'autoload' : {
\   'filetypes' : ['javascript', 'typescript', 'html'],
\}}
"let g:js_indent_typescript = 1
"NeoBundleLazy 'clausreinke/typescript-tools', {
"\ 'build' : 'npm install -g',
"\ 'autoload' : {
"\   'filetypes' : ['typescript'] }
"\}
"
" NeoBundleLazy 'Quramy/tsuquyomi', {
" \ 'build' : 'npm -g install typescript',
" \ 'autoload' : {
" \   'filetypes' : ['typescript'] }
" \}

" if has('unix')
"   " シンタックスチェック
"   NeoBundle 'https://github.com/scrooloose/syntastic.git'
" endif

" git関連
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'mattn/webapi-vim'
"TODO NeoBundle 'mattn/gist-vim'
NeoBundle 'lambdalisue/vim-gista'
let g:gista#github_user = 'tiijima'

" とりあえずWin32,Win64の場合のみOmniSharpを利用する {{{
if has('win32') || has('win64')
  NeoBundleLazy 'nosami/Omnisharp', {
        \   'autoload': {'filetypes': ['cs']},
        \   'build': {
        \     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
        \     'mac': 'xbuild server/OmniSharp.sln',
        \     'unix': 'xbuild server/OmniSharp.sln',
        \   }
        \ }
  NeoBundle 'https://github.com/tpope/vim-dispatch.git'
endif
"}}}

" vimproc.vim {{{
" vimproc.vim を使用する場合は自前でビルドする必要があり
" kaoriya 版 vim では vimproc.vim が同梱されているので必要がないです
if has('unix')
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }
endif
"}}}

" vim-php-cs-fixer {{{
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {
\    'autoload' : {
\        'filetypes': 'php',},}
let s:hooks = neobundle#get_hooks('vim-php-cs-fixer')
function! s:hooks.on_source(bundle)
"  let g:php_cs_fixer_path = '$HOME/.vim/phpCsFixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
  let g:php_cs_fixer_level = ""

  let g:php_cs_fixer_path = '$HOME/.composer/vendor/friendsofphp/php-cs-fixer/php-cs-fixer' " define the path to the php-cs-fixer.phar
  let g:php_cs_fixer_rules = "@PSR2"              " which level ?
  let g:php_cs_fixer_php_path='php'           " Path to PHP
  let g:php_cs_fixer_enable_default_mapping=1 " Enable the mapping by default (<leader>pcd)
  let g:php_cs_fixer_dry_run=1                " Call command with dry-run option
  let g:php_cs_fixer_verbose=1                " Return the output of command if 1, else an inline information.
  nnoremap <Leader>php :call PhpCsFixerFixFile()<CR>
endfunction
unlet s:hooks
"}}}

" vue.js {{{
"NeoBundle 'https://github.com/posva/vim-vue'
"}}}


call neobundle#end()
" }}}


NeoBundleCheck

filetype plugin indent on

" unite.vim {{{
" インサートモードで開始する
let g:unite_enable_start_insert=1
nnoremap [Unite] <Nop>
nmap ,u [Unite]

" ファイル一覧
noremap [Unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"file file_current_dir
noremap [Unite]ff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"レントディレクトリ以下のファイルを再帰的にすべて探索する
" noremap :ufr :Unite file_rec:<C-r>=expand('%:p:h:gs?[ :]?\\\0?')
noremap [Unite]fr :<C-u>Unite file_rec<CR>
" レジスタ一覧
noremap [Unite]r :<C-u>Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap [Unite]u :<C-u>Unite buffer file_mru<CR>
" マークの一覧
nnoremap <silent> [Unite]m :<C-u>Unite mark -no-quit<CR>
" ブックマーク一覧
nnoremap <silent> [Unite]b :<C-u>Unite bookmark<CR>
" カラースキーム表示確認
" ujihisa/unite-colorschemeが必要
nnoremap <silent> [Unite]cl :<C-u> Unite colorscheme -auto-preview<CR>
" Gistのリストを表示する
nnoremap <silent> [Unite]l :<C-u> Unite gista<CR>


augroup UniteGroup
  autocmd!
  " ESCキーを2回押すと終了する
  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <C-u> ../
augroup END
" }}}

" unite-mru {{{
" 履歴に無視するファイルを追加
" 	TortoiseSVNの差分用tmpファイル
" let s:file_mru_ignore_pattern = (unite#sources#rec#define()[0]['ignore_pattern']) . '\|.*rev.*\.svn.*\.tmp\..*'
" call unite#custom#source('file_mru', 'ignore_pattern', s:file_mru_ignore_pattern)
"}}}

" unite-grep {{{
"grepコマンドのパス
let g:unite_source_grep_command = $GREP_PATH
"let g:unite_source_grep_encoding = 'euc-jp'
let g:unite_source_grep_encoding = 'utf8'
" grepで無視したパタン
" defaultそのままなのでコメントアウト
" let g:unite_source_grep_ignore_pattern='\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|\%(^\|/\)tags\%(-\a*\)\?$'
let g:unite_source_grep_ignore_pattern=
      \'\~$\|\.\%(o\|obj\|lib\|exe\|dll\|bak\|sw[po]\)$\|'.
      \'\%(^\|/\)\%(himix\|output\|PGRelief\|rom\)\%($\|/\)\|'.
      \'\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|'.
      \'\%(^\|/\)tags\%(-\a*\)\?$'

"grepコマンドのオプション
"let g:unite_source_grep_default_vpts = '-fiRHn'
let g:unite_source_grep_default_vpts = '-iRHn'
let g:unite_source_grep_max_candidates = 1500
call unite#custom#source('grep', 'max_candidates', 1500)

"高さ13行
"画面分割して下側に表示する
"結果を選択してもフォーカスを移動しない
"インサートモードで始めない
"対象を選択してもUniteを閉じない
nnoremap [Unite]g :<C-u>Unite grep -buffer-name=search -winheight=13 -direction=botright -keep-focus -no-start-insert -no-quit<CR>
" nnoremap [Unite]g :<C-u>Unite grep:%:-iRhn -buffer-name=search -winheight=13 -direction=botright -keep-focus -no-start-insert -no-quit<CR>
" ↑引数でTarget指定。　この方法だと、Target指定時に一つ上の階層選択とかできないのでびみょん。
" TODO Unite grep呼び出す前に、Target入力させるようにすれば、unite grepのソース修正しないでOKかも。あとでscriptつくる
" nnoremap :ug :call StartUniteGrep()<CR>
" nnoremap :ug :<C-u>Unite grep -buffer-name=search -default-action=tabopen -no-quit<CR>./*
" nnoremap :ug :tabnew <C-R>%<CR>:<C-u>Unite grep -buffer-name=search -no-quit<CR>./*

"良く分からないが一つ上の階層から検索したい場合に、下記３つの現象が起きてしまいうまくgrepできない。。。
"１．Unite grepにてgrepオプションに-Rをつけて../*とすると、grep結果の階層表示が
"　　おかしくなりgrep結果からファイルへのジャンプが正しくできなくなった
"
"２．Unite grepにてgrepオプションに-Rをつけて../**/*とすると、grep結果が重複して
"　　しまう
"
"３．Unite grepにてgrepオプションに-Rをつけずに../**/*とすると、grep結果が一部重複
"　　する
"結局、検索したいディレクトリに移動（カレントディレクトリを変更）してから./*でgrepすれば良い
"面倒なので、Unite-grepのデフォルトターゲットに現在作業中のディレクトリを設定
"するように修正してしまうのもあり
" function! StartUniteGrep()
"   if exists('+autochdir')
" 	  exe "set noautochdir"
"   endif
"   exe "Unite grep -buffer-name=search -winheight=13 -direction=botright -keep-focus -no-start-insert -no-quit"
"   "getcwd()
" endfunction
" }}}

" unite-shortcut {{{
" コマンドを登録して unite.vim で選択して起動
" 参考：http://d.hatena.ne.jp/osyo-manga/20111010/1318228589

let s:unite_source = {
\   'name' : 'shortcut'
\}

function! s:unite_source.gather_candidates(args, context)
    let cmds = {
\		'AllMap' : 'Unite output:map',
\		'edit vimrc' : 'edit $MYVIMRC',
\   }

    return values(map(cmds, "{
\       'word' : v:key,
\       'source' : 'shortcut',
\       'kind' : 'command',
\       'action__command' : v:val
\   }"))
endfunction

call unite#define_source(s:unite_source)

" 呼び出しのキーマップ
nnoremap <silent> [Unite]s :Unite shortcut<CR>
" }}}

" neocomplete {{{
"" 起動時に有効化
"let g:neocomplete#enable_at_startup = 1
"" neocompleteが強制的に’completefunc’を上書きする
"" ただし、プラグインの’completefunc’は使用できなくなる。
"let g:neocomplete#force_overwrite_completefunc=1
"
"
"" キャッシュの位置
"let g:neocomplete#data_directory = $RAM_DISK_PATH . '/.vim/.cache/neocomplete'
""ctagsへのパス
"let g:neocomplete#ctags_command = $CTAGS_PATH
"
"
"" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
"let g:neocomplete#enable_smart_case = 1
"" AutoComplPopを無効化する(念のため)
"let g:acp_enableAtStartup = 0
"" 補完するキーワード長の最小長さ
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"" 自動補完を行わないバッファ名 いまいちよくわからない。。
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"" キャッシュしないファイル名
"let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.map'
""自動補完を無効にするかどうかを制御する。
""1ならば自動補完が無効になるが、<C-x><C-u> による手動補完は使用できる。
"let g:neocomplete#disable_auto_complete = 0
"
"
"" 補完するためのキーワードパターンを指定
"if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
"endif
""日本語を補完候補として取得しないようにする
"let g:neocomplete#keyword_patterns._ = '\h\w*'
"
"inoremap <expr><C-o> &filetype == 'vim' ? "\<C-x><C-u><C-p>" : "\<C-x><C-o>"
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"
"" Enable omni completion.
"augroup SetOmniCompletionSetting
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"augroup END
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cs = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
""C#用のインクルード補完 {{{
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
"" }}}
" }}}

" neosnippet {{{
let g:neosnippet#data_directory = $RAM_DISK_PATH . '/.vim/.cache/neosnippet/'

let g:neosnippet#enable_snipmate_compatibility = 1

" スニペットファイルの配置場所
let g:neosnippet#snippets_directory = $HOME . '/vimfiles/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"スニペットの編集
noremap <SPACE>es :<C-u>NeoSnippetEdit<CR>
"}}}

"Vimfiler {{{
"カレントバッファのディレクトリを開く
noremap ,, :<C-u>VimFilerBufferDir<CR>
"}}}


" Align.vim {{{
"日本語環境で使用するための設定
let g:Align_xstrlen = 3
"メニューを非表示
let g:DrChipTopLvlMenu = ""
"}}}

" VimWiki {{{
" http://nanasi.jp/vim/vimwiki.html
let g:vimwiki_list =  [{'path':'~/vimwiki/common/', 'path_html':'~/vimwiki_html/common_html/', 'css_name':'css/style.css'}
					\ ,{'path':'~/vimwiki/laurel/', 'path_html':'~/vimwiki_html/laurel_html/', 'css_name':'css/style.css'}]

hi VimwikiLink guifg=#88CCFF

" }}}


" foldCC.vim {{{
set foldtext=FoldCCtext()
set foldcolumn=5
set fillchars=vert:\|
" }}}

"vim-altr 関連ファイルをワンタッチ切替 {{{
"------------------------------------
"関連するファイルのパターンを定義しておけば、
"ワンタッチで、関連ファイルを順番に切り替えることが出来る
"------------------------------------
nmap <C-c> <Plug>(altr-forward)
call altr#define('%.c', '%.h')
call altr#define('%.cpp', '%.hpp', '%.h')
call altr#define('%.h', '%.cpp', '%.c')

"Ctrl+wで画面右側に関連ファイルを開く
nmap <C-w>e :<C-u>vsplit<CR>:wincmd l<CR><Plug>(altr-forward)
"}}}

" vim-easymotion {{{
"set relativenumber
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key= '<Space><Space>'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1

" カラー設定変更
"hi EasyMotionTarget ctermbg=none ctermfg=red
"hi EasyMotionShade  ctermbg=none ctermfg=blue
hi clear EasyMotionTarget
hi clear EasyMotionShade

augroup SetEasyMotionHighlight
  autocmd!
  autocmd BufEnter * hi EasyMotionTarget term=bold cterm=bold ctermfg=25 gui=bold guifg=#ff0000 ctermfg=1
  autocmd BufEnter * hi EasyMotionShade term=bold cterm=bold ctermfg=25 gui=bold guifg=#aaaaaa
augroup END

"}}}

" easyoperator {{{
nmap d<space>l <Plug>(easyoperator-line-delete)
nmap y<space>l <Plug>(easyoperator-line-yank)
" }}}

" smartchr {{{
" function! SmartcharWapper(type, ...)
"   if &ft == 'cpp' || &ft == 'h' || &ft == 'c' || &ft == 'java' || &ft == 'javascript'
"     return smartchr#loop(a:1, a:2, a:3, a:4)
"   elseif &ft == 'vim'
"     return a:type
"   endif
"   return a:type
" endfunction
" inoremap <silent> = <C-R>=SmartcharWapper('=', ' = ', ' == ', '=')<CR>
" inoremap <silent> + <C-R>=SmartcharWapper('+', ' + ', '++', '+')<CR>
" inoremap <silent> - <C-R>=SmartcharWapper('-', ' - ', '--', '-')<CR>
" inoremap <silent> / <C-R>=SmartcharWapper('/', ' / ', '// ', '/')<CR>
" inoremap <silent> * <C-R>=SmartcharWapper('*', ' * ', '*')<CR>

" 単純に複数文字打ちたいときとかじゃまなのでコメントアウト
"inoremap <expr> = smartchr#loop('=', ' == ', ' != ')
"inoremap <expr> + smartchr#loop('+', '++ ')
"inoremap <expr> - smartchr#loop('-', '-- ')
" inoremap <expr> / smartchr#loop('/', '// ', '//*/')
" inoremap <expr> * smartchr#loop('*', ' * ')
"TODO これできない？ inoremap <expr> . smartchr#loop('.', '->')
" inoremap <expr> > smartchr#loop('>', '>=', ' >> ')
" inoremap <expr> < smartchr#loop('<', '<=', ' << ')
" }}}

"vim-quickhl 複数個所をハイライト {{{
let g:quickhl_manual_enable_at_startup = 1

nnoremap [Quickhl] <Nop>
nmap <Space> [Quickhl]
nmap [Quickhl]m <Plug>(quickhl-manual-this)
xmap [Quickhl]m <Plug>(quickhl-manual-this)
nmap [Quickhl]M <Plug>(quickhl-manual-reset)
xmap [Quickhl]M <Plug>(quickhl-manual-reset)
"nmap [Quickhl]j <Plug>(quickhl-match)
" }}}

" anzu 現在の検索位置を画面に表示する {{{
" http://d.hatena.ne.jp/osyo-manga/20130501/1367413547

" n や N の代わりに使用します。
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
nmap * <Plug>(anzu-star)Nzz
nmap # <Plug>(anzu-sharp)zz

" " ステータス情報を statusline へと表示する
" set statusline=%{anzu#search_status()}

" こっちを使用すると
" 移動後にステータス情報をコマンドラインへと出力を行います。
" statusline を使用したくない場合はこっちを使用して下さい。
" nmap n <Plug>(anzu-n-with-echo)
" nmap N <Plug>(anzu-N-with-echo)
" nmap * <Plug>(anzu-star-with-echo)
" nmap # <Plug>(anzu-sharp-with-echo)

nmap <silent> <Esc><Esc> <Plug>(anzu-clear-search-status):<C-u>nohlsearch<CR>
" }}}

" lightline statuslineをなんかかっこよくしてくれるやつ {{{
" http://d.hatena.ne.jp/itchyny/20130824/1377351527

" 変数定義してデフォルトをlandscapeにする
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p = g:lightline#colorscheme#landscape#palette

let s:p.normal.left     = [ [ '#0000ff', '#ffffff', 21,  231, 'bold' ], [ '#ffffff', '#0000ff', 231, 21   ]      ]
let s:p.normal.middle   = [ [ '#ffffff', '#666666', 231, 21   ]      ]
let s:p.normal.right    = [ [ '#000000', '#d0d0d0', 236, 252, 'bold' ], [ '#303030', '#9a9a9a', 236, 245, 'bold' ], [ '#bcbcbc', '#585858', 250, 240 ] ]
let s:p.inactive.left   = [ [ '#ffffff', '#333333', 21,  231, ]      ]
let s:p.inactive.middle = [ [ '#ffffff', '#333333', 231, 21   ]      ]
let s:p.tabline.left    = [ [ '#ffffff', '#606060', 253, 241  ]      ]
let s:p.tabline.tabsel  = [ [ '#ffffff', '#1212F2', 253, 233  ]      ]

let g:lightline#colorscheme#MyLightlineColor#palette = s:p
unlet s:p

"%{anzu#search_status()} で現在の検索位置を表示する 用:anzuプラグイン
let g:lightline = {
	\ 'colorscheme': 'MyLightlineColor',
	\ 'active': {
	\   'left': [
	\     ['mode', 'paste'],
	\     ['readonly', 'filename', 'modified', 'search_status'],
	\   ],
	\   'right': [
	\     ['lineinfo'],
	\     ['percent'],
	\     ['fileformat', 'fileencoding', 'filetype'],
	\   ]
	\ },
  \ 'inactive': {
	\   'left': [
	\     ['readonly', 'filename', 'modified'],
	\   ],
	\   'right': [
	\   ]
  \ },
	\ 'component_function': {
	\   'search_status': 'anzu#search_status',
	\ },
	\ 'subseparator': {'left': '|', 'right': '|'}
\ }


" }}}

" vim-ref {{{
" lynxが必要なのでインストールしてlynx.exeとlynx.cfgを同じフォルダに配置してパスを通す
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

"以下を設定してもうまくいかなかったので、
"lynx.cfg内のCHARACTER_SETをutf-8にしている
"  CHARACTER_SET:utf-8
"let g:ref_refe_encoding = 'Shift-JIS'

nmap ,rp :<C-u>Ref phpmanual <C-R><C-W>
" }}}

" PDV--phpDocumentor-for-Vim {{{
" Default values
let g:pdv_cfg_Type = 'mixed'
let g:pdv_cfg_Package = ''
let g:pdv_cfg_Version = '$id$'
let g:pdv_cfg_Author = ''
let g:pdv_cfg_Copyright = ''
let g:pdv_cfg_License = ''

inoremap <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>
" }}}

" open-browser {{{

if has('mac')
  let g:netrw_nogx = 1
else
  if has('unix')
    let g:openbrowser_browser_commands = [{'name': 'firefox', 'args': ['{browser}', '{uri}']},]
  endif
endif
nmap <Leader>bo <Plug>(openbrowser-smart-search)
vmap <Leader>bo <Plug>(openbrowser-smart-search)

" file指定の場合はブラウザで開く(1の場合はvimで開く)
let g:openbrowser_open_filepath_in_vim = 0
" カレントのHTMLをブラウザで開くコマンド
command! OpenBrowserCurrent execute 'OpenBrowser' 'file:///' . expand('%:p:gs?\\?/?')
" }}}


" unite-tag {{{
" http://d.hatena.ne.jp/osyo-manga/20120205/1328368314
" path にヘッダーファイルのディレクトリを追加することで
" neocomplcache が include 時に tag ファイルを作成してくれる
set path+=$LIBSTDCPP
set path+=$BOOST_LATEST_ROOT

" neocomplcache が作成した tag ファイルのパスを tags に追加する
function! s:TagsUpdate()
    " include している tag ファイルが毎回同じとは限らないので毎回初期化
    setlocal tags=
    for filename in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
        execute 'setlocal tags+='.neocomplcache#cache#encode_name('tags_output', filename)
    endfor
endfunction


command!
    \ -nargs=? PopupTags
    \ call <SID>TagsUpdate()
    \ |Unite tag:<args>

function! s:get_func_name(word)
    let end = match(a:word, '<\|[\|(')
    return end == -1 ? a:word : a:word[ : end-1 ]
endfunction


" カーソル下のワード(word)で絞り込み
noremap <silent> g<C-]> :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" カーソル下のワード(WORD)で ( か < か [ までが現れるまでで絞り込み
" 例)
" boost::array<std::stirng... → boost::array で絞り込み
" noremap <silent> G<C-]> :<C-u>execute 'PopupTags '
"     \.substitute(<SID>get_func_name(expand('<cWORD>')), '\:', '\\\:', "g")<CR>
" }}}

" Quickrun {{{
" 実行時間を計測する
let g:quickrun_config = {
\   '_' : {
\       'outputter/buffer/split' : ':botright',
\       'outputter/buffer/close_on_empty' : 1
\   },
\   'cpp/g++' : {
\       'hook/time/enable' : 1
\   },
\}

"参考：http://garasubo.github.io/blog/2013/04/18/mkd-vim/
"let g:quickrun_config = {}
"let g:quickrun_config.mkd = {
"            \ 'outputter' : 'browser',
"            \   'command': 'pandoc',
"            \   'exec': '%c --from=markdown --to=html %o %s %a',
"            \ }
"}}}

" DoxygenToolkit {{{
let g:DoxygenToolkit_commentType = 'C++'
" }}}

" syntastic {{{
if has('unix')
  let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': ['php']
    \}
  let g:syntastic_auto_loc_list = 1
  "let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
  let g:syntastic_php_checkers = ['php', 'phpmd']
endif
" }}}

"gist.vim {{{
" let g:gist_show_privates = 1
" let g:gist_post_private = 1
" }}}



" }}}

" == 基本設定 == {{{

"  === 表示設定 === {{{
if has('vim_starting')
"  colorscheme molokai
set t_Co=256
  colorscheme mydefault
endif

"" フォントの設定は_gvimrcでもすること
"" フォント名に日本語名を使うので、一時的に文字コードを変える
"setlocal fileencoding=iso-2022-jp
"if has('unix')
"  set guifont=ゆたぽん（コーディング）Bold\ 11
"else
"  set guifont=ゆたぽん（コーディング）:h14:cSHIFTJIS
"endif
"setlocal fileencoding=utf-8


if has('vim_starting')
  "行番号を表示する
  set number
  " 検索にマッチしたテキストをハイライトする
  set hlsearch
  "タブを '>.' で，行末を '<' で表示
  set listchars=tab:>.,eol:<
  "タブと改行を表示する
  set list
  "タブ文字の幅
  set tabstop=4
  "自動インデントの際に使う1レベル分のインデント量
  set shiftwidth=4
  "タブ文字の代わりに挿入されるホワイトスペースの量
  set softtabstop=4
  " タブをスペースに展開しない (expandtab:展開する)
  set noexpandtab
  "入力中のコマンドをステータスに表示する
  set showcmd
  "括弧入力時の対応する括弧を表示
  set showmatch
  "ステータスラインを常に表示
  set laststatus=2
  " コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
  set cmdheight=1
  " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
  set wildmenu
  " 検索関連
  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
  set ignorecase
  "検索文字列に大文字が含まれている場合は区別して検索する
  set smartcase
  "検索時に最後まで行ったら最初に戻る
  set wrapscan
  ""検索文字列入力時に順次対象文字列にヒットさせる
  set incsearch
endif


"タブページを常に表示する
set showtabline=2

"折り返し表示しないようにする
set nowrap

"補完の設定 候補が1つしかないときもポップアップメニューを使う。
set completeopt=menuone

"折りたたみの設定{{{
set foldmethod=manual
"set foldmethod=syntax
"foldmethodについて
"manual	    折り畳みは手動で設定する。(.viminfoファイルに情報が記録される？)
"indent	    等しいインデントの行で折り畳みを作る。
"expr	    オプション 'foldexpr' で深さを設定する。 
"marker	    マーカーで折り畳みを指定する。
"syntax	    構文強調表示のキーワードを使って指定する。
"diff	    変更されていないテキストを折り畳む。

"zf で挿入されるマーカーが/* */でくくられないようにする
set commentstring=%s
"}}}


augroup SetVueFileType
  autocmd!
  autocmd BufNewFile,BufRead *.{vue*} set filetype=html
augroup END

"  === 動作設定 === {{{

"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500

"自動的に折り返さないようにする
set formatoptions=

"自動改行しない
set textwidth=0

"クリップボードを利用する
if has('mac')
  set clipboard=unnamed
else
  if has('unix')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 入力モードで自動的に日本語入力を使わない
"set iminsert=0

"インサートモードでバックスペースを使う
set backspace=indent,eol,start

" 検索で自動的に日本語入力を使わない
set imsearch=0

"Hack #125: 矩形選択で自由に移動する
"http://vim-users.jp/2010/02/hack125/
"値を初期化
set virtualedit&
set virtualedit+=block

" バッファを切り替えても、undo を効くように設定
" (変更をセーブせずにバッファを切り替えたいときにも、 :set hidden は役に立つが、
"  変更に気づかないまま":qa! "するという危険も伴う、諸刃の剣)
" set hidden

" スワップファイルを作成しない
set noswapfile

" php {{{
" 文字列中のSQLをハイライトする
let php_sql_query=1
" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1
" ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags = 1
" クラスと関数の折りたたみ(folding)を有効にする
let php_folding = 1
" }}}

"}}}

"  === パス === {{{
"スワップファイルの場所
" noswapfileを設定してスワップファイルを作成しないようにしているので不要
" set directory=C:/tmp

" なんかあったとき用にとりあえずバックアップファイルを作っておく
set backup
" バックアップファイルの保存場所を設定する
if isdirectory($HOME . '/.vim/tmp/backup') == 0
  call mkdir($HOME . '/.vim/tmp/backup', 'p')
endif
set backupdir=$HOME/.vim/tmp

" undo履歴ファイルの場所
" setしてもフォルダがない場合は生成されないみたいなので、
" フォルダがない場合は作る
if isdirectory($RAM_DISK_PATH . '/.vim/undo') == 0
  call mkdir($RAM_DISK_PATH . '/.vim/undo', 'p')
endif
set undodir=$RAM_DISK_PATH/.vim/undo

"grepからvimgrepが使えるようにする
"set grepprg=internal

"tagファイルをCのルートディレクトリまで遡って探す
set tags=./tags,tags;C:\,tags
"}}}

" }}}

" == その他設定 == {{{

" === 表示設定 === {{{

".mdのファイルもfiletypeがmarkdownとなるようにする{{{

" 'Modula 2'から*.mdを消す
" au BufNewFile,BufRead *.m2,*.DEF,*.MOD,*.md,*.mi setf modula2
" ↓
" au BufNewFile,BufRead *.m2,*.DEF,*.MOD,*.mi setf modula2

augroup SetMarkdownFileType
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
"  autocmd BufNewFile,BufRead *.md  setf mkd
augroup END
"}}}

"{{{
" Markdownでのイタリックフォントを無効にする。
" http://qiita.com/rbtnn/items/58a68e4981c52b1872ad
autocmd! FileType markdown hi! def link markdownItalic LineNr
"}}}

augroup SetActionScriptFileType
  autocmd!
  autocmd BufNewFile,BufRead *.as set filetype=actionscript
augroup END

"Hack #84: バッファの表示設定を保存する {{{
"http://vim-users.jp/2009/10/hack84/
"バッファの設定は'viewdir'に保存されます。初期値はWindowsの場合は”$VIM/vimfiles/view”, Linux等の場合は”~/.vim/view”となっています。 
" バッファ表示設定の保存場所を作成する
""""" TODO if isdirectory($HOME . '/.vim/view') == 0
""""" TODO   call mkdir($HOME . '/.vim/view', 'p')
""""" TODO endif
""""" TODO set viewdir=$HOME/.vim/view
""""" TODO augroup ViewOptionHook
""""" TODO 	autocmd!
""""" TODO 	autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
""""" TODO 	autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
""""" TODO augroup END
""""" TODO " Don't save options.
""""" TODO set viewoptions-=options
"}}}

" lightlineを入れたのでstatusline系,tabpages系はコメントアウト {{{

" "ステータスラインに文字コード等表示 {{{
" "iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
" "%{fugitive#statusline()} でGitの今表示しているソースのブランチ名を表示する 用:fugitiveプラグイン
" "%{anzu#search_status()} で現在の検索位置を表示する 用:anzuプラグイン
" if has('iconv')
"   set statusline=%<%f\ %{fugitive#statusline()}\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %{anzu#search_status()}%=[0x%{FencB()}]\ (%v,%l)/%L%8P
" else
"   set statusline=%<%f\ %{fugitive#statusline()}\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %{anzu#search_status()}%=\ (%v,%l)/%L%8P
" endif
" 
" "FencB() : カーソル上の文字コードをエンコードに応じた表示にする
" function! FencB()
"   let c = matchstr(getline('.'), '.', col('.') - 1)
"   let c = iconv(c, &enc, &fenc)
"   return s:Byte2hex(s:Str2byte(c))
" endfunction
" 
" function! s:Str2byte(str)
"   return map(range(len(a:str)), 'char2nr(a:str[v:val])')
" endfunction
" 
" function! s:Byte2hex(bytes)
"   return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
" endfunction
" "}}}

" "挿入モード時、ステータスラインのカラー変更 {{{
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=#FFFF88 gui=none ctermfg=blue ctermbg=yellow cterm=none'
" if has('syntax')
"   augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * call s:StatusLine('Enter')
"     autocmd InsertLeave * call s:StatusLine('Leave')
"   augroup END
" endif
" " if has('unix') && !has('gui_running')
" " " ESCですぐに反映されない対策
" " inoremap <silent> <ESC> <ESC>
" " endif
" 
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"   if a:mode == 'Enter'
"     silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"     silent exec g:hi_insert
"   else
"     highlight clear StatusLine
"     silent exec s:slhlcmd
"     redraw
"   endif
" endfunction
" 
" function! s:GetHighlight(hi)
"   redir => hl
"   exec 'highlight '.a:hi
"   redir END
"   let hl = substitute(hl, '[\r\n]', '', 'g')
"   let hl = substitute(hl, 'xxx', '', '')
"   return hl
" endfunction
" "}}}

" " 各タブページのカレントバッファ名+αを表示 {{{
" "参考：http://d.hatena.ne.jp/thinca/20111204/1322932585
" "参考：http://d.hatena.ne.jp/leafcage/20120214/1329183521
" function! s:tabpage_label(n)
"   " t:title と言う変数があったらそれを使う
"   let title = gettabvar(a:n, 'title')
"   if title !=# ''
"     return title
"   endif
" 
"   " タブページ内のバッファのリスト
"   let bufnrs = tabpagebuflist(a:n)
" 
"   " カレントタブページかどうかでハイライトを切り替える
"   let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
" 
"   " バッファが複数あったらバッファ数を表示
"   let no = len(bufnrs)
"   if no is 1
"     let no = ''
"   endif
"   " タブページ内に変更ありのバッファがあったら '+' を付ける
"   let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, '&modified')')) ? '+' : ''
"   let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける
" 
"   " カレントバッファ
"   let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr() は 1 origin
"   let fname = pathshorten(bufname(curbufnr))
"   if fname == ''
" 	  let fname = '無名'
"   endif
" 
"   let label = no . mod . sp . fname
" 
"   return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
" endfunction
" 
" " タブラインに設定する情報を生成する関数
" function! MakeTabLine()
"   let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
"   let sep = ' | '  " タブ間の区切り
"   let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
"   let info = ''  " 好きな情報を入れる
"   " ファイルパスはタイトルバーにも表示されているので不要 {{{
"   " let info .= '%#TabLineInfo#'
"   " let info .= ' ' . fnamemodify(getcwd(), ":~") . ' '
"   " }}}
"   return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
" endfunction
" 
" " タブラインを設定する
" set tabline=%!MakeTabLine()
" 
" "}}}

"}}}

"}}}

" === 動作設定 === {{{

"Hack #205: 複数行をコメントアウトする {{{
"http://vim-users.jp/2011/03/hack205/
" Comment or uncomment lines from mark a to mark b."
function! CommentMark(docomment, a, b)
  if !exists('b:comment')
    let b:comment = CommentStr() . ' '
  endif
  if a:docomment
    exe "normal! '" . a:a . "_\<C-V>'" . a:b . 'I' . b:comment
  else
    exe "'".a:a.",'".a:b . 's/^\(\s*\)' . escape(b:comment,'/') . '/\1/e'
  endif
endfunction

" Comment lines in marks set by g@ operator.
function! DoCommentOp(type)
  call CommentMark(1, '[', ']')
endfunction

" Uncomment lines in marks set by g@ operator.
function! UnCommentOp(type)
  call CommentMark(0, '[', ']')
endfunction

" Return string used to comment line for current filetype.
function! CommentStr()
  if &ft == 'cpp' || &ft == 'h' || &ft == 'c' || &ft == 'java' || &ft == 'javascript' || &ft == 'php'
    return '//'
  elseif &ft == 'vim'
    return '"'
  elseif &ft == 'python' || &ft == 'perl' || &ft == 'sh' || &ft == 'R' || &ft == 'ruby'
    return '#'
  elseif &ft == 'lisp'
    return ';'
  endif
  return ''
endfunction

nnoremap <Leader>c <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>c <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>
"}}}

"行番号を無名レジスタにコピーする {{{
function! Get_buffer_curent_line_number()
  let @* = line('.')
endfunction
nnoremap <silent> gl :<C-u>call Get_buffer_curent_line_number()<Return>
"}}}

" 常に開いているファイルと同じディレクトリをカレントディレクトリにする{{{
" http://www15.ocn.ne.jp/~tusr/vim/vim_text2.html#mozTocId567011
augroup vimrc_group__cd
    autocmd!
    autocmd BufEnter * execute ':lcd ' . (isdirectory(expand('%:p:h')) ? expand('%:p:h') : '')
augroup END
"}}}

" Vimdiffで空文字を除外 {{{
set diffexpr=IgnoreSpaceDiff()
function! IgnoreSpaceDiff()
  let opt = ''
  if &diffopt =~ 'icase'
    let opt = opt . '-i '
  endif
  if &diffopt =~ 'iwhite'
    let opt = opt . '-b '
  endif
  silent execute "!diff --ignore-all-space -a " . opt .
        \ v:fname_in . " " . v:fname_new .
        \ " > " . v:fname_out
endfunction
" }}}

" }}}

" make 関連 {{{
"
" MsBuild {{{
"let $PATH = $PATH . ';C:\WINDOWS\Microsoft.NET\Framework\v3.5'
let $PATH = $PATH . ';C:/WINDOWS/Microsoft.NET/Framework/v4.0.30319'
"autocmd BufNewFile,BufRead *.cbproj,*.xaml setf xml
"autocmd BufNewFile,BufRead *.cbproj,*.cs,*.xaml compiler msbuild
"}}}

" MSBuildを利用したC++BuilderXE2でのmake {{{
"参考：http://docwiki.embarcadero.com/RADStudio/XE4/ja/MSBuild_%E3%81%AE%E6%A6%82%E8%A6%81
"ここにBDSとFrameworkDirを設定しろと書いてるので設定する。
"コレが無いと確かにエラーになる
let $BDS = 'c:\program files\Embarcadero\RAD Studio\9.0'
let $FrameworkDir = ';C:\WINDOWS\Microsoft.NET\Framework\v3.5'

augroup MakeHook
	autocmd!
	"参考：http://d.hatena.ne.jp/palm3r/20080914/p1
	"良く分からないけどとりあえずおまじない
	autocmd BufNewFile,BufRead *.cbproj setf xml
	"以下で設定したファイルに関連付けるcompilerを設定する
	"$VIMRUNTIME/compilerに以下の内容で"msbuild.vim"を作成しておくこと。
	autocmd BufNewFile,BufRead *.cbproj,*.c,*.cpp,*.h,*.hpp compiler msbuild

	"makeコマンド実行後にcwindowを自動的に開くようにする
	autocmd QuickfixCmdPost make cwindow
augroup END

"プロジェクトファイルの場所
let $ProjectRoot='C:\tiijima\project\CBM21\NEC\RM_Tool\prj\MultipleTarget\src\rmt\src'

"makeコマンドのキーバインド
nnoremap <silent> <C-F9> :<C-u>cd $ProjectRoot<CR>:<C-u>make /t:Make /p:Platform=Win32 /p:config=Debug /v:n /nologo<CR>
"/t:Make, Build, Rebuld
"使用できる詳細レベル: q[uiet]、m[inimal]、 n[ormal]、d[etailed]、diag[nostic]

"}}}

"}}}

" uncrustify コードフォーマット関連 {{{
" 参考：http://qiita.com/ton1517/items/c864ea2f51b19aa120b6
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

" http://www.6809.net/tenk/html/lib/doc/indent_readme.htm
" 「uncrustify.exe」を上記よりDLした「uncrustify_for_mbc_2010-01-26」の「uncrustify.exe」と差し替え
" configにて「use_mbc = True」することによって、日本語文字列が文字化けしないようになる

if has('vim_starting')
	" uncrustifyの実行ファイル格納場所へのパスを通す
	let $PATH = $PATH . ';' . $HOME . '\uncrustify\bin'
endif

" 例: Shift-Fでコードのフォーマットを行う．
nnoremap <S-f> <S-v>:call UncrustifyAuto()<CR>
vnoremap <S-f> :call UncrustifyAuto()<CR>

" 例: 保存時に自動フォーマット
" autocmd BufWritePre <buffer> :call UncrustifyAuto()

" uncrustifyの設定ファイル
let g:uncrustify_cfg_file_path = $HOME . '\uncrustify\uncrustify.cfg'

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
	" Save the last search.
	let search = @/
	" Save the current cursor position.
	let cursor_position = getpos('.')
	" Save the current window position.
	normal! H
	let window_position = getpos('.')
	call setpos('.', cursor_position)
	" Execute the command.
	execute a:command
	" Restore the last search.
	let @/ = search
	" Restore the previous window position.
	call setpos('.', window_position)
	normal! zt
	" Restore the previous cursor position.
	call setpos('.', cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
	call Preserve(':silent '."'".'<,'."'".'>!uncrustify'.' -q '.' -l '.a:language.' -c '.
				\shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
endfunction

function! UncrustifyLangType()
	if &ft == 'c'
		return 'c'
	elseif &ft == 'cpp'
		return 'cpp'
	elseif &ft == 'java'
		return 'java'
	elseif &ft == 'objc'
		return 'oc'
	elseif &ft == 'cs'
		return 'cs'
	endif
	return ''
endfunction

"Visualモードで範囲指定したときのみ呼び出されることを想定している
function! UncrustifyAuto() range
	let l:uncrustify_lang = UncrustifyLangType()
	if l:uncrustify_lang != ''
		call Uncrustify(l:uncrustify_lang)
	endif
endfunction
" }}}

"}}}

" == キーマップ == {{{

" === 基本 === {{{

" 表示行単位で上下移動する
nnoremap j gj
nnoremap k gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" 行選択する（Shift+vだと小指が痛くなる）
noremap <SPACE>v V

" Ctrl+eでinsertモードからnormalモードに戻る
" imap <C-e> <C-[>
" vmap <C-e> <C-[>
inoremap jj <Esc>
onoremap jj <Esc>
cnoremap jj <C-c>
inoremap jk <Esc>
onoremap jk <Esc>
cnoremap jk <C-c>
inoremap j<Space> j
onoremap j<Space> j
cnoremap j<Space> j
"全角で　　を打ち込んでEnterした場合は
"IME入力モードに戻ってからnormalモードに切り替える
inoremap 　　 <C-^><Esc>
onoremap 　　 <C-^><Esc>
cnoremap 　　 <C-^><C-c>

"IMEの入力モードを切り替える
inoremap <C-Space> <C-^>
onoremap <C-Space> <C-^>
cnoremap <C-Space> <C-^>

"Hack #214: 括弧までを消したり置き換えたりする
"http://vim-users.jp/2011/04/hack214/
" onoremap ) t)
" onoremap ( t(
" onoremap ] t]
" onoremap [ t[
" text-objectを使っているので微妙だったので以下を定義
vnoremap ) a)
vnoremap ( i(
vnoremap ] a]
vnoremap [ a[

" 保存して閉じる と 保存せず閉じる はとりあえず封印
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" EXモード移行もとりあえず封印
nnoremap Q <Nop>

" qでウインドウを閉じて Qでマクロ
nnoremap q :<C-u>q<CR>
nnoremap Q q

" ノーマルモード時のカーソル行で改行する
nnoremap <CR> o<ESC>

"Vim設定ファイルのオープン・リロードコマンド {{{
"Vim、GVimの設定ファイルを開く
nnoremap <silent> <Space>ev  :tabnew<CR>:<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :tabnew<CR>:<C-u>edit $MYGVIMRC<CR>
"Vim、GVimの設定をリロードする
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR><C-u>:set foldmethod=marker<CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>:cclose<CR>
nnoremap <silent> <Space>rr :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR><C-u>source $MYGVIMRC<CR>
nnoremap <silent> <Space>rr <NOP>

"}}}

" 検索関連はanzuプラグイン側で設定するのでここではコメントアウト
" "検索場所に戻る
" nnoremap * *N
" "検索後画面の中心に。
" nmap n nzz
" nmap N Nzz

"Hack #104: Visual mode で選択したテキストを検索する
"http://vim-users.jp/2009/11/hack104/
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>zz

"分割画面の移動
noremap <SPACE>h <C-W>h
noremap <SPACE>l <C-W>l
noremap <SPACE>j <C-W>j
noremap <SPACE>k <C-W>k

"%の置き換え
noremap <Space>n %

"タブ移動
noremap ,h :<C-u>noautocmd tabprev<CR>
noremap ,l :<C-u>noautocmd tabnext<CR>

"Hack #122: 行末までヤンクする
"http://vim-users.jp/2010/02/hack122/
nnoremap Y y$

"新規タブを開く
noremap <C-w>t :<C-u>tabnew<CR>
"タブを閉じる
noremap <C-w>y :<C-u>tabclose<CR>

"vimで特定のファイルの特定行に飛ぶ
"http://takesy.cocolog-nifty.com/atico/2009/06/vim-528e.html
set isfname=\ ,@,48-57,\\,/,.,-,_,+,,,#,$,%,{,},[,],@-@,!,~,=
noremap <F12> <C-w>o<C-w>sgF

"normalモードからインデントを保持して改行する
noremap <silent> <C-CR>    o<LEFT><ESC><RIGHT>

"現在ファイルのディレクトリをカレントディレクトリに変更する
noremap CD :<C-u>cd %:h<CR>:pwd<CR>

"別のタブでタグジャンプの結果を表示する
"noremap g<C-]> :tabe <C-R>%<Enter><C-]>
"ジャンプ元ファイルの場所をカレントディレクトリとしてタグジャンプする
"  複数のプロジェクト間で作業する場合にカレントディレクトリが切り替わらないと
"  ジャンプ先が意図しないところになってしまうため
noremap <silent> <C-]> :<C-u>cd %:h<CR>:pwd<CR><C-]>

"ヤンク文字を続けてペーストする
"http://qiita.com/fukajun/items/bd97a9b963dae40b63f5
"0番のレジスタ内容をペーストしてやれば良い
nnoremap <silent> <C-p> "0p
nnoremap <silent> <C-P> "0P
vnoremap <silent> <C-p> "0p

" ヤンクした文字列とカーソル位置の単語を置換する
" カーソル位置以降の文字列とヤンクした単語を置換する
nnoremap <silent> cy    ce<C-r>0<ESC>:let@/=@-<CR>:noh<CR>
vnoremap <silent> cy    c<C-r>0<ESC>:let@/=@-<CR>:noh<CR>
" テキストオブジェクト的にカーソルが単語内のどこになってもヤンクした文字列を置換する
nnoremap <silent> ciy   ciw<C-r>0<ESC>:let@/=@-<CR>:noh<CR>

" Esc Esc でハイライトOFF
" anzuプラグイン側で定義したのでここではコメントアウト
"nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" エンコードを変更
nnoremap <silent> <Space>eu :<C-u>set encoding=utf-8<CR>
nnoremap <silent> <Space>ed :<C-u>set encoding=cp932<CR>

" 相対行数表示と絶対行数表示を切り替える
" http://cohama.hateblo.jp/entry/2013/10/07/020453
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
nnoremap <F4> :<C-u>setlocal number!<CR>

" カーソル位置を行頭トグルする
" http://qiita.com/kentaro/items/8669d98ceb9b11d645e4
" nnoremap <expr> 0 match(strpart(getline('.'), 0, col('.') - 1), '^\s\+$') >= 0 ? '0' : '^'

" " 行頭 → 非空白行頭 → 行末 をローテートする
" " http://qiita.com/Linda_pp/items/ee4bf64b1fe2c0a32cbd
" function! s:rotate_in_line() "{{{
"     let l:c = col('.')
" 
"     let l:cmd = (l:c ==# 1 ? '^' : '$')
"     execute 'normal! '.l:cmd
" 
"     if l:c ==# col('.')
"         if l:cmd ==# '^'
"             normal! $
"         else
"             normal! 0
"         endif
"     endif
" endfunction "}}}
" nnoremap <silent>0 :<C-u>call <SID>rotate_in_line()<CR>

" バッファを削除する
nnoremap <Leader>q :<C-u>:bw<CR>

" utf8で開き直す
nnoremap <F8> :e ++enc=utf8<CR>
" iso-2022-jpで開きなおしてutf8に変換する
nnoremap <F9> :e ++enc=iso-2022-jp<CR>:set fileencoding=utf8<CR>

"}}}

" === 挿入系 === {{{
"削除予定コメントを挿入する
noremap <silent> <SPACE>c 0i// TODO 削除予定 <ESC>
noremap <silent> <SPACE>b O<ESC>0Di/* TODO 削除予定 <ESC>
noremap <silent> <SPACE>t O<ESC>0Diecho 'TODO ' . $todo . '<br>'; <ESC>
noremap <silent> <SPACE>1 a<!-- TODO --> <ESC>

" 日付を挿入する
noremap <silent> <SPACE>d <ESC>a<C-R>=strftime("%Y/%m/%d")<CR>

"}}}

" マーク関連 {{{
" 参考：http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
nnoremap [Mark] <Nop>
nmap m [Mark]

" 現在位置をマーク
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>[Mark]m :<C-u>call <SID>s:AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" 次/前のマーク
nnoremap [Mark]n ]`
nnoremap [Mark]p [`

" 一覧表示
" nnoremap [Mark]l :<C-u>marks<CR>
" uniteでマーク一覧を表示するキーを割り当てているのでコメントアウトしておく

" バッファ読み込み時にマークを初期化
augroup MarkAutoCmd
	autocmd!
	autocmd BufReadPost * delmarks!
augroup END

" }}}

"VimGrepコマンドのショートカット {{{
"K でカーソル下の単語をGrepして別タブで結果を表示する
"noremap K    :vimgrep /<C-R><C-W>/ **.*<CR>:tabnew<CR>:copen<CR>
"noremap K    :vimgrep /<C-R><C-W>/j ..\**\*.*<CR>:tabnew<CR>:copen<CR>
"noremap K    :vimgrep /<C-R><C-W>/j ..\**\*.c ..\**\*.h ..\**\*.cpp<CR>:tabnew<CR>:copen<CR>
noremap K    :<C-u>vimgrep /<C-R><C-W>/j ..\**\*.c ..\**\*.h ..\**\*.cpp | cw
"gK でカーソル下の文字列をGrepして別タブで結果を表示する
"noremap gK    :vimgrep '<C-R><C-W>' **.*<CR>:tabnew<CR>:copen<CR>
noremap gK    :<C-u>vimgrep "<C-R><C-W>"j ..\**\*.c ..\**\*.h ..\**\*.cpp<CR>:tabnew<CR>:copen<CR>
"}}}

"TortoiseSVN コマンド"{{{
nnoremap [TortoiseSVN] <Nop>
nmap :t [TortoiseSVN]
" Save the current buffer and execute the Tortoise SVN interface's diff program
" TortoiseSVNの差分ビューア設定で
"   gvim.exe --remote-tab-silent +"vertical diffsplit %base" %mine
" としておくと現在開いているgVim上でdeffを開くことが出来る
map <silent> [TortoiseSVN]d :<C-u>call s:TortoiseDiff()<CR>
function! s:TortoiseDiff() "{{{
  let l:filename = expand('%')
  call g:thread('"C:/Program Files/TortoiseSVN/bin/TortoiseProc.exe"  /command:diff /path:"' . l:filename . '" /notempfile /closeonend:0')
endfunc
"}}}

" TortoiseSVN ログを開く
map <silent> [TortoiseSVN]l :<C-u>call s:TortoiseLog()<CR>
function! s:TortoiseLog() "{{{
  let l:filename = expand('%')
  call g:thread('"C:/Program Files/TortoiseSVN/bin/TortoiseProc.exe" /command:log /path:"' . l:filename . '" /closeonend:0')
endfunc
"}}}

" Save the current buffer and execute the Tortoise SVN interface's revision graph
map <silent> [TortoiseSVN]r :<C-u>w<CR>:silent !"C:\Progra~1\TortoiseSVN\bin\TortoiseProc.exe /command:revisiongraph  epath:"%" /notempfile /closeonend"<CR>

" Tortoise SVN 注釈履歴を表示する
map [TortoiseSVN]b :<C-u>call s:TortoiseBlame()<CR>
function! s:TortoiseBlame() "{{{
  let l:filename = expand('%')
  let l:linenum  = line('.')
  call g:thread('"C:/Program Files/TortoiseSVN/bin/TortoiseProc.exe"  /command:blame /path:"' . l:filename . '" /line:' . l:linenum . ' /notempfile /closeonend')
endfunc
"}}}
""}}}

"左右で開いているファイルのdiffを取る {{{
nmap <silent> <F2> <C-W>hggVG:BlockDiff1<CR><C-W>lggVG:BlockDiff2<CR>
" diff関連のキーマップ
nmap <silent> ]c ]czz
nmap <silent> [c [czz
nnoremap <silent> <C-j> ]czz
nnoremap <silent> <C-k> [czz
nnoremap <silent> <F5> :<C-u>diffu<CR>
"}}}

" Eclipseでファイルを開く {{{
"map <silent> ,eo :<C-u>!"C:/Programs/pleiades/eclipse/eclipse.exe" %<CR>
map <silent> ,eo :<C-u>call s:OpenEclipse()<CR>
function! s:OpenEclipse() "{{{
  let l:filename = expand('%')
  exe(':r! "C:/Programs/pleiades/eclipse/eclipse.exe" ' . l:filename)
endfunc
" }}}
" }}}

" 端末上の Vim からローカルにコピーする {{{
" " yank to remote
" " macだと改行コードの関連で行コピーがうまく動かないので動作しないようにする
" if !has('mac') && !has('windows')
"   let g:y2r_config = {
"         \   'tmp_file': '/tmp/exchange_file',
"         \   'key_file': expand('$HOME') . '/.exchange.key',
"         \   'host': 'localhost',
"         \   'port': 52224,
"         \}
"   function! g:Yank2Remote()
"     call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
"     let s:params = ['cat %s %s | nc -w1 %s %s']
"     for s:item in ['key_file', 'tmp_file', 'host', 'port']
"       let s:params += [shellescape(g:y2r_config[s:item])]
"     endfor
"     let s:ret = system(call(function('printf'), s:params))
"   endfunction
"   nnoremap <silent> <Leader>y :call Yank2Remote()<CR>
"   nnoremap <silent> yy yy:call Yank2Remote()<CR>
" endif
" 参考：https://qiita.com/tMinamiii/items/0c6589806090c7fc3f8a
augroup Yank
    au!
    " Yankにフックしてレジスタに登録された文字をwin32yankにも出力する
    autocmd TextYankPost * :call system('win32yank.exe -i', @")
augroup END
" win32yank内の文字を一旦vimのレジスタに登録してからペイストする
nnoremap <silent> p :call setreg('"',system('win32yank.exe -o'))<CR>""p
vnoremap <silent> p :call setreg('"',system('win32yank.exe -o'))<CR>""gvp

" }}}

" }}}

"}}}

func! Hankaku() range
  let str = getline(a:firstline, a:lastline)
perl << EOF
use utf8;
use Encode;
my $text = decode_utf8(VIM::Eval('str'));
my $firstline = VIM::Eval('a:firstline');
my @list = ();
for my $str (split /\n/, $text) {
  $str =~ tr/０-９ａ-ｚＡ-Ｚ/0-9a-zA-Z/;
  push @list, $str;
}
$main::curbuf->Set($firstline, @list);
EOF
execute "normal " . a:lastline . "gg"
endf

"============================================================================
" vim:set foldmethod=marker:

