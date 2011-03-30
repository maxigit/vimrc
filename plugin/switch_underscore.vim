

function! Switch_isk_underscore()
let old_isk = &isk
set isk+=_
if &isk == old_isk
echo "underscore mode"
set isk-=_
else
echo "normal mode"
end
endfunction

map __ :call Switch_isk_underscore()<cr>
"map , __

