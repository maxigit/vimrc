
"toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    exe "normal \<c-w>="
    unlet g:windowMax
  else
    augroup maxCurrWin
      " au BufEnter * exe "normal \<c-w>_\<c-w>\<Bar>"
      "
      " only max it vertically
      au! WinEnter * exe "normal \<c-w>_"
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
noremap <Leader>wO :call ToggleMaxWins()<CR>
