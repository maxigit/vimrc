" Vim compiler file
" Compiler:         Quickfix-list errorformat
" Maintainer:
" Latest Revision:  2008-09-10

if exists("current_compiler")
  finish
endif
let current_compiler = "quickfix"

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat=
                        \%-G%f:%l:\ All\ of\ '%#%.depend'%.%#,
      \%f%.%l\ col\ %c%.\ %m


let &cpo = s:cpo_save
unlet s:cpo_save 
