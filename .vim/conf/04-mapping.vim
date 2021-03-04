cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-d> <Del>
inoremap <silent> jk <Esc>
inoremap <silent> jj <Esc>
nnoremap <silent> <Space>f :<C-u>Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent> <Space>u :<C-u>Denite file_mru<CR>
nnoremap <silent> <Space>e :<C-u>sf ~/.config/nvim/init.vim<CR>
nnoremap <silent> gr :<C-u>Unite grep:%:-iRHn -buffer-name=search -winheight=1 -keep-focus -auto-preview -no-start-insert -no-quit<CR>
