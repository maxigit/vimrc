setlocal foldmethod=expr
if exists("b:did_haskell_ftplugin")
  finish
end
let b:did_haskell_ftplugin=1
setlocal includeexpr=substitute(v:fname,'\\.','/','g') 
setlocal suffixesadd=.hs,.lhs
setlocal include=import
let &l:define='^\(data\s*\|type\s*\|newtype\s*\|\s*\ze\i\+\s*\(::\|.*\s=\|<-\)\)'

setlocal foldexpr=Myfold(v:lnum)
setlocal foldtext=Mytext()
setlocal foldmethod=expr
setlocal fillchars+=fold:\ 


function Myfold(line) 
  if getline(a:line) =~'^module'
    return ">2"
  elseif getline(a:line) =~'^{-#'
    return 9
  elseif getline(a:line) =~'^import'
    return 2
  elseif getline(a:line) =~'^[<|^#]' " hamlet
    return 1
  elseif getline(a:line) =~'^-'
    return "1"
  elseif getline(a:line) =~'^\() *\)*where'
    return "<1"
  elseif getline(a:line) =~'^\S.*::'
    return ">1"
  elseif getline(a:line-1)=~'^\s\|^\s*$\|^--'&&getline(a:line)=~'^\S'
    return ">1"
  endif 
  return 2
endfunction

function Mytext()
  let l:n = v:foldstart
  let l:line =  ""
  while l:line =~ '^\s*$'
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

