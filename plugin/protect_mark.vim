"author: Maxime Bourget , from stackoverflow
"Prevent global mark overriden
function s:SetMark()
  let m=getchar()
  if type(m)==type(0)
    let m=nr2char(m)
  endif
  if m=~#'^[A-Z]$'
    let pos=getpos("'".m)
    if pos[1]
      echohl Error
      echon "Mark ".m." is arleady set. Overwrite?"
      echohl None
      let c=getchar()
      if type(c)==type(0)
        let c=nr2char(c)
      endif
      echo
      if c!=?'y'
        return "<C-l>"
      endif
    endif
  endif
  return "m".m
endfunction
nnoremap <special><expr> m <SID>SetMark()
