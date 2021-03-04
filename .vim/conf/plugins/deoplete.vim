" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
