" Vim compiler file
" Compiler: Haskell repl - ghci
" Author: Maxime Bourget

if exists("current_compiler")
  finish
endif
let current_compiler="ghci"
" inherit from stack settings
" compiler stack
 
let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=stack\ repl

CompilerSet errorformat=%*[^\ ]>\ %#%f:%.%l%.%c%.%#
CompilerSet errorformat+=%+G%.%#>\ :%m
CompilerSet errorformat+=%.%#\ --\ Defined\ at\ %f:%.%l%.%c%.%#
CompilerSet errorformat+=%f:%.%l%.%c%.%#
CompilerSet errorformat+=%+G%.%#>%m

let &cpo = s:cpo_save
unlet s:cpo_save
