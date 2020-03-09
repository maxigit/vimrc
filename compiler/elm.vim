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
CompilerSet errorformat=%P%.%#--%.%#-\ %f
CompilerSet errorformat+=%l\|%.%#

" CompilerSet errorformat+=%+G%.%#>%m

let &cpo = s:cpo_save
unlet s:cpo_save
