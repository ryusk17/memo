call plug#begin('~/.config/nvim/plugged')

" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim' | Plug 'h1mesuke/unite-outline'
Plug 'Shougo/vimfiler.vim' | Plug 'thinca/vim-qfreplace' | Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tyru/caw.vim'
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

Plug 'h1mesuke/vim-alignta'
Plug 'junegunn/vim-easy-align'
Plug 'icymind/NeoSolarized'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'thinca/vim-quickrun'
Plug 'vim-jp/vimdoc-ja'
Plug 'itchyny/lightline.vim'
Plug 'vim-syntastic/syntastic'
Plug 'koryschneider/vim-trim'

Plug 'posva/vim-vue'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-abolish'

Plug 'figitaki/vim-dune'
" Plug 'juanchanco/vim-jbuilder'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'ngmy/vim-rubocop'
" Plug 'ruby-formatter/rufo-vim'

" Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
" Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
" Plug 'kristijanhusak/deoplete-phpactor'


" Plug 'Shougo/neoinclude.vim'
"Plug 'zchee/libclang-python3'
"Plug 'deoplete-plugins/deoplete-clang'
"Plug 'lyuts/vim-rtags'
"Plug 'taketwo/vim-ros'
"Plug 'dbgx/lldb.nvim'
"Plug 'posva/vim-vue'

" Plug 'sakhnik/nvim-gdb'
" Plug 'cespare/vim-toml'

Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'jmcomets/vim-pony'

" Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'branch': 'release/1.x',
"  \ 'for': [
"    \ 'javascript',
"    \ 'typescript',
"    \ 'css',
"    \ 'less',
"    \ 'scss',
"    \ 'json',
"    \ 'graphql',
"    \ 'markdown',
"    \ 'vue',
"    \ 'lua',
"    \ 'php',
"    \ 'python',
"    \ 'ruby',
"    \ 'html',
"    \ 'swift' ] }

Plug 'jparise/vim-graphql'

call plug#end()
