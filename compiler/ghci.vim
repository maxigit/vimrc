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

CompilerSet errorformat=%*[^\ ]>\ %#%f:%l:%c%.%#
CompilerSet errorformat+=%+G%.%#>\ :%m
CompilerSet errorformat+=%.%#--\ Defined\ at\ %f:%l:%c
CompilerSet errorformat+=%Iinstance\ %m%>
CompilerSet errorformat+=%Z%.%#\ --\ Defined\ at\ %f:%l:%c%.%#
CompilerSet errorformat+=\%E%o\ %#>%f:%l:%c:\ error:,%+Z\ \ \ \ %m,
    \%E%o\ %#>%f:%l:%c:\ error:\ %m,%-Z,
    \%W%o\ %#>%f:%l:%c:\ warning:,%+Z\ \ \ \ %m,
    \%W%o\ %#>%f:%l:%c:\ warning:\ %m,%-Z,
    \%E%f:%l:%c:\ error:,%+Z\ \ \ \ %m,
    \%E%f:%l:%c:\ error:\ %m,%-Z,
    \%W%f:%l:%c:\ warning:,%+Z\ \ \ \ %m,
    \%W%f:%l:%c:\ warning:\ %m,%-Z,
    \%f(%l%.%c)-%.%#,
CompilerSet errorformat+=%+G%.%#>%m

let &cpo = s:cpo_save
unlet s:cpo_save
