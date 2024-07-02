setlocal efm=%f|%
if exists("b:did_my_qf_ftplugin")
  finish
end
let b:did_my_qf_ftplugin=1

setlocal efm=%f\|%l\ %t%*[^\|]\|\ %m,\|\|%m

setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~\"^\|\"?1:'>1'
setlocal foldlevel=1

