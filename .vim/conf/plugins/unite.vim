let g:unite_enable_start_insert = 1
let g:unite_winheight = 15
let g:unite_data_directory=expand("~/.config/nvim/tmp/unite/")
if executable('ag')
  " Use ag (the silver searcher)
  " https://github.com/ggreer/the_silver_searcher
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'
let g:unite_split_rule = 'topleft'

nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap <silent> [unite]u  :<C-u>Unite -buffer-name=files file_mru buffer bookmark file<CR>
nnoremap <silent> [unite]c  :<C-u>Unite command<CR>
nnoremap <silent> [unite]h  :<C-u>Unite help<CR>
nnoremap <silent> [unite]b  :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files directory_rec/async<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file file_mru<CR>
nnoremap <silent> [unite]s  :<C-u>Unite -buffer-name=files -no-split jump_point file_point buffer_tab file_rec:! file file/new file_mru<CR>
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
catch
endtry
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
    nmap <buffer> <ESC>      <Plug>()
    nmap <buffer> q       <Plug>(unite_exit)
    imap <buffer> jk      <Plug>(unite_insert_leave)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    imap <buffer> kk      <Plug>(unite_insert_leave)
    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
    \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
    \ unite#smart_map('l', unite#do_action('default'))
    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif
    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
    \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction
