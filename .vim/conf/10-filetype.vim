" vim:set expandtab tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=marker:

" Vim {{{
autocmd BufRead,BufNewFile *vimrc call s:vim_detect_settings() "php設定を読み込み
function! s:vim_detect_settings()
  setfiletype vim
  setlocal formatoptions-=ro   "折り返し設定
endfunction " }}}

" PHP {{{
autocmd BufRead,BufNewFile *.php call s:php_detect_settings() "php設定を読み込み
autocmd BufRead,BufNewFile *.ctp call s:php_detect_settings() "ctpをphpファイルとして認識
function! s:php_detect_settings()
  setfiletype php
  inoremap <buffer> { {}<LEFT>
  inoremap <buffer> ' ''<Left>
  inoremap <buffer> " ""<Left>
  inoremap <buffer> [ []<LEFT>
  inoremap <buffer> ( ()<LEFT>
  inoremap <buffer><expr> - smartchr#loop('-', '->')
  function! s:at()
    let syntax = synstack(line('.'), col('.'))
    let name = empty(syntax) ? '' : synIDattr(syntax[-1], "name")
    return name =~# 'None\|String\|Comment' ? '@' : '$this->'
  endfunction
  inoremap <expr> <buffer> @ <SID>at()
endfunction " }}}

" JavaScript {{{
autocmd BufRead,BufNewFile *.js call s:js_detect_settings()
function! s:js_detect_settings()
  setfiletype javascript
  inoremap <buffer>{ {}<LEFT>
  inoremap <buffer>' ''<Left>
  inoremap <buffer>" ""<Left>
  inoremap <buffer>[ []<LEFT>
  inoremap <buffer>( ()<LEFT>
endfunction " }}}

" Markdown {{{
autocmd BufRead,BufNewFile *.md call s:md_detect_settings()
function! s:md_detect_settings()
  " #での折りたたみ
  setfiletype markdown
  setlocal foldmethod=expr
  setlocal foldexpr=MarkdownFold()
  function! MarkdownFold()
    let head = s:head(v:lnum)
    if head
      return head
    elseif v:lnum != line('$') && getline(v:lnum + 1) =~ '^#'
      return '<' . s:head(v:lnum + 1)
    endif
    return '='
  endfunction
  function! s:head(lnum)
    return strlen(matchstr(getline(a:lnum), '^#*'))
  endfunction

  " Github FlavoredなTODO切り替え
  nnoremap <buffer> <Space><Space> :call s:toggleCheckbox()<CR>
  function! s:toggleCheckbox()
    let l:line = getline('.')
    if l:line =~ '^\-\s\[\s\]'
      let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
      call setline('.', l:result)
    elseif l:line =~ '^\-\s\[x\]'
      let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
      call setline('.', l:result)
    end
  endfunction
endfunction
" }}}

" JSON {{{
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal formatoptions=tcq2l
  autocmd FileType json setlocal textwidth=78 shiftwidth=2
  autocmd FileType json setlocal softtabstop=2 tabstop=8
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal foldmethod=syntax
augroup END
" }}}

au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
au! BufRead,BufNewFile *.md setfiletype markdown
