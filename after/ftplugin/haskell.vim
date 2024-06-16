setlocal foldmethod=expr
if exists("b:did_haskell_ftplugin")
  finish
end
let b:did_haskell_ftplugin=1
setlocal includeexpr=substitute(v:fname,'\\.','/','g') 
setlocal suffixesadd=.hs,.lhs
let &l:include='^\s*import\(\s*qualified\)\{,1}'
" let &l:define='^\(data\s*\|type\s*\|newtype\s*\|import\>.*\s\?as\s\+\|\s*\ze\i\+\s*\(::\|.*\s=\|<-\)\)'
let &l:define='^\(data\s*\|type\s*\|newtype\s*\|import\>.*\s\?as\s\+\|\s*\ze\i\+\s*\(::\)\)'

setlocal fillchars+=fold:\ 
setlocal iskeyword+='

function MarkImport()
         let s:lastImport = search('^import\>', 'bnw')
         if s:lastImport
            execute s:lastImport "mark" "i"
         endif
endfunction
function MarkData()
         let s:lastData = search('^\(data\|type\)\>', 'n')
         if s:lastData
            execute s:lastData "mark" "d"
         endif
endfunction

call MarkImport()
call MarkData()
augroup Haskell
autocmd InsertLeave <buffer> call MarkImport() | call MarkData()
augroup END


" Text object motions
"nnoremap ) zj
"vnoremap ) zj
"nnoremap ( zk
"vnoremap ( zk

"ghci
nnoremap <space>rr :call TmuxSend(":r\n")<CR>
nnoremap <space>rb :call TmuxSend(":l *" . expand("%:p")."\n")<CR>
nnoremap <space>rc :call TmuxSend(":set +c -fbyte-code\n:l " . expand("%:p")."\n")<CR>
nnoremap <space>rt :call TmuxSend(":t " . expand("<cword>")."\n")<CR>
nnoremap <space>ra :call TmuxSend("appMain\n")<CR>
nnoremap <space>rm :call TmuxSend("main\n")<CR>
nnoremap <space>ri :call TmuxSend(":i " . expand("<cword>")."\n")<CR>
nnoremap <space>rn :call TmuxSend(":nowarn\n:r\n")<CR>
vnoremap <space>rt :call Haskell_type_at("type-at")<CR>gv
vnoremap <space>ru :call Haskell_type_at("uses")<CR>gv
vnoremap <space>rl :call Haskell_type_at("loc-at")<CR>gv
nmap <space>rT viw<space>rtv
nmap <space>rU viw<space>ruv
nmap <space>rL viw<space>rlv

function Haskell_type_at(mode) range
  " mode can be type-at uses loc-at
  let l:command = printf (":%s %s %d %d %d %d\n",a:mode,  expand("%:p"), line('.'), col("'<"), line("'>"), col("'>")+1)
  call TmuxSend(l:command)
endfunction

compiler ghci
" syntax match Conceal "\<forall\>" conceal cchar=∀
setl conceallevel=2

iabbrev <buffer> #l {-# LANGUAGE  #-}<left><left><left><left>
iabbrev <buffer> #w {-# OPTIONS_ghc -W  #-}<left><left><left><left>
iabbrev <buffer> #o {-# OPTIONS_ghc  #-}<left><left><left><left>
iabbrev <buffer> #d {-# OPTIONS_ghc -Wno-deprecations #-}

setlocal thesaurus+=~/.vim/thesaurus/haskell_extensions.thes
