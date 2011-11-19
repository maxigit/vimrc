function! Doom()
echo "Turbo mode"
noremap i k
noremap k j
noremap l l
noremap j h
noremap o e
noremap u b
noremap h ^
noremap y $

noremap e 5k
noremap d 5j
noremap f 5l
noremap s 5h
noremap r E
noremap w B
noremap a 0
noremap g L
noremap t H
noremap q 1G
noremap a G

noremap I O
noremap K o
noremap L ea
noremap J bi
noremap O Ea
noremap U Bi
noremap H i
noremap Y a

noremap D ciw
noremap F ce
noremap S cb
noremap E ciW
noremap R cE
noremap W cB
noremap " ci"
noremap ' ci'
noremap % ci%

noremap c ci
noremap C ca
map <silent> ; :call Undoom()<Cr>
endfunction

function! Undoom()
echo "Normal mode"
unmap "
unmap %
unmap '
unmap C
unmap D
unmap E
unmap F
unmap H
unmap I
unmap J
unmap K
unmap L
unmap O
unmap R
unmap S
unmap U
unmap W
unmap Y
unmap a
unmap c
unmap d
unmap e
unmap f
unmap g
unmap h
unmap i
unmap j
unmap k
unmap l
unmap o
unmap q
unmap r
unmap s
unmap t
unmap u
unmap w
unmap y
map <silent> ; :call Doom()<Cr>
endfunction

map <silent> ; :call Doom()<Cr>

