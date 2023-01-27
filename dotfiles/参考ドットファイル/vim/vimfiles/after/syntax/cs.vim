
" Folding {{{
" 以下のcsharp.vim内から抜粋
" http://www.vim.org/scripts/script.php?script_id=116
function! CSharpFoldText(add)
	let line = getline(v:foldstart + a:add)
	let sub = substitute(line, '#region\s', '', 'i')
	let ts = &tabstop
	let text = ""
	while (l:ts > 0)
		let text = text . v:folddashes[0]
		let ts = ts - 1
	endwhile
	return substitute(sub, "\t", text, "g")
endfunction

syn region csharpRegionFold start="#region" end="#endregion" transparent fold
syn sync fromstart
set foldmethod=syntax foldcolumn=2 foldtext=CSharpFoldText(0)
" }}}

