" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Sep 12

" This file sets up the default methods for highlighting.
" It is loaded from "synload.vim" and from Vim for ":syntax reset".
" Also used from init_highlight().

if !exists("syntax_cmd") || syntax_cmd == "on"
  " ":syntax on" works like in Vim 5.7: set colors but keep links
  command -nargs=* SynColor hi <args>
  command -nargs=* SynLink hi link <args>
else
  if syntax_cmd == "enable"
    " ":syntax enable" keeps any existing colors
    command -nargs=* SynColor hi def <args>
    command -nargs=* SynLink hi def link <args>
  elseif syntax_cmd == "reset"
    " ":syntax reset" resets all colors to the default
    command -nargs=* SynColor hi <args>
    command -nargs=* SynLink hi! link <args>
  else
    " User defined syncolor file has already set the colors.
    finish
  endif
endif

" Many terminals can only use six different colors (plus black and white).
" Therefore the number of colors used is kept low. It doesn't look nice with
" too many colors anyway.
" Careful with "cterm=bold", it changes the color to bright for some terminals.
" There are two sets of defaults: for a dark and a light background.
SynColor Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
SynColor Todo		term=standout cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=Blue guibg=Yellow
SynColor String	term=underline cterm=none ctermfg=DarkRed ctermbg=Yellow gui=NONE guifg=Magenta guibg=NONE
SynColor Comment	term=bold cterm=NONE ctermfg=DarkBlue ctermbg=Yellow gui=NONE guifg=Blue guibg=NONE
SynColor Statement	term=bold cterm=NONE ctermfg=Blue ctermbg=NONE gui=bold guifg=Brown guibg=NONE

hi Statement ctermfg=DarkBlue
hi Comment ctermbg=LightCyan

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
SynLink Character	Constant
SynLink Number		Constant
SynLink Boolean		Constant
SynLink Float		Number
SynLink Function	Identifier
SynLink Conditional	Statement
SynLink Repeat		Statement
SynLink Label		Statement
SynLink Operator	Statement
SynLink Keyword		Statement
SynLink Exception	Statement
SynLink Include		PreProc
SynLink Define		PreProc
SynLink Macro		PreProc
SynLink PreCondit	PreProc
SynLink StorageClass	Type
SynLink Structure	Type
SynLink Typedef		Type
SynLink Tag		Special
SynLink SpecialChar	Special
SynLink Delimiter	Special
SynLink SpecialComment	Special
SynLink Debug		Special

delcommand SynColor
delcommand SynLink
