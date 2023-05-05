" Vim compiler file
" Compiler: elm
" Author: Maxime Bourget

if exists("current_compiler")
  finish
endif
let current_compiler="elm"
" inherit from stack settings
" compiler stack
 
let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=npm\ run\ elm\ --\ make
set errorformat=
set errorformat+=%E%>%.%#--\ %m\ -%#\ %f
set errorformat+=%-C%>
set errorformat+=%C%>%m
set errorformat+=%C%>
set errorformat+=%C%>%l\|%.%#
set errorformat+=%-C%>
set errorformat+=%C%>%m
set errorformat+=%Z%>
set errorformat+=%-Z

" CompilerSet errorformat+=%+G%.%#>%m

let &cpo = s:cpo_save
unlet s:cpo_save
