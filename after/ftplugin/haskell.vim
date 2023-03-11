setlocal foldmethod=expr
if exists("b:did_haskell_ftplugin")
  finish
end
let b:did_haskell_ftplugin=1
setlocal includeexpr=substitute(v:fname,'\\.','/','g') 
setlocal suffixesadd=.hs,.lhs
let &l:include='^\s*import\(\s*qualified\)\{,1}'
let &l:define='^\(data\s*\|type\s*\|newtype\s*\|import\>.*\s\?as\s\+\|\s*\ze\i\+\s*\(::\|.*\s=\|<-\)\)'

setlocal foldexpr=Myfold2(v:lnum)
setlocal foldtext=Mytext()
setlocal foldmethod=expr
setlocal fillchars+=fold:\ 
setlocal foldlevel=4
setlocal iskeyword+='


" Only fold on type signature or comments
function Myfold2(line)
  if a:line==1
    return 4
  endif
  let l:line = getline(a:line)
  if l:line =~ '^-- \*\*\*'
    return ">3"
  elseif l:line =~ '^-- \*\*'
    return ">2"
  elseif l:line =~ '^-- \*'
    return ">1"
  elseif l:line =~ '^-- |'
    return ">4"
  elseif getline(a:line) =~'^\(\s*--\s*\)\?import'
    return "5"
  elseif l:line =~ '^instance\>'
    return "5"
  elseif l:line =~ '^module\>'
    return "4"
  elseif l:line =~ '^\(\S.*::\|data\|type\|newtype\)\>' " type signature
    if getline(a:line-1) =~ '^--' 
      return "4"
    else
      return ">4"
    endif
  elseif l:line =~ '^-- '
    return "4"
  elseif l:line =~ '^\s*$'
    return "="
  endif
  return "="
endfunction
function Myfold(line) 
  if getline(a:line) =~'^module'
    return ">4"
  elseif getline(a:line) =~'^-- \*\*\*'
    return ">3"
  elseif getline(a:line) =~'^-- \*\*'
    return ">2"
  elseif getline(a:line) =~'^-- \*'
    return ">1"
  elseif getline(a:line) =~'^{-#'
    return 9
  elseif getline(a:line) =~'^\(\s*--\s*)\?import'
    return 5
  elseif getline(a:line) =~'^[<|^#]' " hamlet
    return 5
  elseif getline(a:line) =~'^-'
    return "5"
  elseif getline(a:line) =~'^\() *\)*where'
    return "<5"
  elseif getline(a:line) =~'^\S.*::'
    return ">5"
  elseif getline(a:line-5)=~'^\s\|^\s*$\|^--'&&getline(a:line)=~'^\S'
    return ">5"
  endif 
  return 5
endfunction

function Mytext()
  let l:n = v:foldstart
  let l:line =  ""
  while l:line =~ '^\s*$\|^\s*-- *[^* ]'
    let l:line = getline(l:n)
    let l:n+=1
  endwhile
   " find first non empty line
  let l:right = printf("[%d]", v:foldend-v:foldstart)
  return printf("%s%*s", l:line, winwidth(0)-strlen(l:line)-2-&fdc, l:right)
endfunction
function Mytext2()
  let l:n = v:foldstart+1
  let l:width = winwidth(0)
  let l:line = getline(v:foldstart)
  while l:n <= v:foldend
    let l:next = getline(l:n)
    let l:new = l:line . substitute(l:next, '^\s*', " ; ", "")
    if strlen(l:new) > l:width
      return l:line . " ... "
    elseif strlen(l:new) == l:width
      return l:new
    endif
    let l:line = l:new
    let l:n= l:n+1
  endwhile
  return l:line . " []"
endfunction

" Text object motions
nnoremap ) zj
vnoremap ) zj
nnoremap ( zk
vnoremap ( zk

"ghci
nnoremap <space>rr :call TmuxSend(":r\n")<CR>
nnoremap <space>rb :call TmuxSend(":l *" . expand("%:p")."\n")<CR>
nnoremap <space>rc :call TmuxSend(":set +c -fbyte-code\n:l " . expand("%:p")."\n")<CR>
nnoremap <space>rt :call TmuxSend(":t " . expand("<cword>")."\n")<CR>
nnoremap <space>ra :call TmuxSend("appMain\n")<CR>
nnoremap <space>rm :call TmuxSend("main\n")<CR>
nnoremap <space>ri :call TmuxSend(":i " . expand("<cword>")."\n")<CR>
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
