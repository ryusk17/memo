" Define mappings
" nnoremap <silent> <Space>u :<C-u>Denite buffer file_mru -smartcase -unique -start-filter<CR>
nnoremap <silent> <Space>u :<C-u>Denite buffer file_mru -smartcase -unique<CR>
"nnoremap <silent> gr :<C-u>Unite grep:%:-iRHn -buffer-name=search -winheight=1 -keep-focus -auto-preview -no-start-insert -no-quit<CR>

" Matchers
call denite#custom#source('buffer', 'matchers', ['matcher/substring', 'matcher/ignore_current_buffer'])
call denite#custom#source('file_mru', 'matchers', ['matcher/substring', 'matcher/ignore_current_buffer'])

" Ag command
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
  nmap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
endfunction
