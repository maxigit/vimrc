" Vim compiler file
" Compiler: Haskell repl - ghci
" Mainter: Maxime Bourget

if exists("current_compiler")
  finish
endif
let current_compiler="ghci"
" inherit from stack settings
" compiler stack
 
let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=stack\ repl

let &cpo = s:cpo_save
unlet s:cpo_save
