function! OneLineFold()
  let sep = "   ¦ "
  let line = getline(v:foldstart)
  let nnum = nextnonblank(v:foldstart + 1)
  if (v:foldend-v:foldstart)>20
      return '✪ '.substitute(line, "^  ", "", "")." ..."
  end
  while nnum < v:foldend+1
    let line = line . sep. substitute(getline(nnum), "^ *", "", "g")
    let sep =   " ¦ "
    let line_left = v:foldend-nnum
    let nnum = nnum + 1
    if len(line) > (winwidth(0)*2/3) && line_left>1
      let endline = substitute(getline(v:foldend), "^\\s*", '', 'g')
      let line  = line.'  ... ('.(line_left).') ¦ '.endline
      break
    end
  endwhile
  return line
endfunction


function! IndentFold()
  let line = getline(v:lnum)
  if match(line, '^\s*$')==0
    return "="
  elseif  match(line, '^\s*#')==0
    return "="
  end
  let level = matchend(line,'^\ *')/2+1
  if match(line, '\C\<def\>\|\<class\>\|\<module\>\|\<dodo\>')>=0
    return ">".level
  end
  
  return level
endfunction
