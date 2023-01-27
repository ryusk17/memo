" C# 専用のキーマッピング

" コードの定義へジャンプ
nnoremap <silent> <buffer> <F12> :OmniSharpGotoDefinition<CR>
" コードの参照元を検索
nnoremap <silent> <buffer> <S-F12> :OmniSharpFindUsages<CR>

" 型情報をメッセージ領域に表示
nnoremap <silent> <buffer> mt :OmniSharpTypeLookup<CR>
" 型を実装している型を検索
" インターフェース上で実行すると、インターフェースを実装している型のリストが出たりする。
nnoremap <silent> <buffer> mi :OmniSharpFindImplementations<CR>
" ビルド
nnoremap <silent> <buffer> mb :OmniSharpBuild<CR>

" nnoremap <silent> <buffer> mc :OmniSharpFindSyntaxErrors<CR>
" nnoremap <silent> <buffer> mf :OmniSharpCodeFormat<CR>
" nnoremap <silent> <buffer> <C-w>mj <C-w>s:OmniSharpGotoDefinition<CR>
" nnoremap <silent> <buffer> mr :OmniSharpRename<CR>
" nnoremap <silent> <buffer> mx :OmniSharpGetCodeActions<CR>
