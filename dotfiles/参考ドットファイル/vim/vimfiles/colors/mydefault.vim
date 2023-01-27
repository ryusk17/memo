" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mydefault"

" vim: sw=2


"改行文字とタブ文字を表示
set list
set listchars=tab:>-,eol:<
"改行文字とタブ文字の色設定（NonTextが改行、SpecialKeyがタブ）
hi NonText guibg=NONE guifg=DarkGreen ctermfg=22
hi SpecialKey guibg=NONE guifg=Gray40 ctermfg=22


hi Title ctermfg=163

hi Normal		guifg=#FFFFFF guibg=#000000
hi Search		guifg=#000000 guibg=#EEEE00 ctermfg=0 ctermbg=185

"gvimrc等の<C-A>などのキーワード
hi Special		guifg=#FF9955 ctermfg=141

"ファイルパス
hi Directory	guifg=#BBBBFF

"対応するカッコの色
hi MatchParen	guifg=gray guibg=magenta cterm=bold ctermfg=1 ctermbg=0

hi constant     guifg=#FFFF00 ctermfg=228
hi comment      guifg=#00FF00 ctermfg=84
hi Statement    guifg=#00FFFF ctermfg=45
"関数・識別子
hi Identifier   guifg=#FFFFFF ctermfg=15
hi PreProc      guifg=#00FFFF ctermfg=205
hi Type         guifg=#00FFFF ctermfg=12
hi Conditional  guifg=#00FFFF ctermfg=39
hi Repeat       guifg=#00FFFF ctermfg=39
hi Exception    guifg=#00FFFF ctermfg=39

" 行番号
hi LineNr guifg=#FFFFFF ctermfg=15


"ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロールバー、スクロールバーのつまみ部分）
highlight Pmenu ctermbg=8 guibg=#606060 ctermbg=238 ctermfg=15
highlight PmenuSel ctermbg=12 guibg=SlateBlue ctermbg=17 ctermfg=157
highlight PmenuSbar ctermbg=0 guibg=#404040
"highlight PmenuThumb ctermbg=0 guibg=Red

" 折りたたみの色
hi Folded guibg=#555555 guifg=#ccccff ctermbg=238 ctermfg=229
" 折りたたみのガイド
hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

"Diffの色
hi DiffText     gui=NONE guifg=#FFAAAA guibg=#1f2700 ctermfg=40 ctermbg=16
hi DiffChange   gui=NONE guifg=#22FFFF guibg=#203f2f ctermfg=228 ctermbg=59
hi DiffDelete   gui=BOLD guifg=#ffff00 guibg=#535320 ctermfg=203 ctermbg=52
hi DiffAdd      gui=NONE guifg=#ffff9f guibg=#474720 ctermfg=84 ctermbg=22

"EasyMotionプラグインのカラー設定
hi EasyMotionTarget ctermfg=1


