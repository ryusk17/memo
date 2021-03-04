"coding style {{{
command!
      \   -bar -nargs=1 -complete=customlist,s:coding_style_complete
      \   CodingStyle
      \   execute get(s:coding_styles, <f-args>, '')
let s:coding_styles = {}
let s:coding_styles['short'] = 'set tabstop=2 shiftwidth=2 softtabstop=2'
let s:coding_styles['long']  = 'set tabstop=4 shiftwidth=4 softtabstop=4'
let s:coding_styles['gnu']   = 'set tabstop=8 shiftwidth=2 softtabstop=2'
let s:coding_styles['bsd']   = 'set tabstop=8 shiftwidth=4 softtabstop&'
let s:coding_styles['linux'] = 'set tabstop=8 shiftwidth=8 softtabstop&'
function! s:coding_style_complete(...)
  return keys(s:coding_styles)
endfunction " }}}

"{{{開いているバッファを新規タブに移動
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction "}}}
nnoremap <silent> <Space>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>

" {{{ Vimdiffで空文字を除外
set diffexpr=IgnoreSpaceDiff()
function IgnoreSpaceDiff()
  let opt = ""
  if &diffopt =~ "icase"
    let opt = opt . "-i "
  endif
  if &diffopt =~ "iwhite"
    let opt = opt . "-b "
  endif
  silent execute "!diff --ignore-all-space -a " . opt .
  \  v:fname_in . " " . v:fname_new .
  \  " > " . v:fname_out
endfunction
" }}}
