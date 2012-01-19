set noswapfile
syntax on

let maplocalleader = " "
"Colemak remap
set langmap=njuek;juekn,NJUEK;JUEKN "same as above but
set langmap+=tg,gt,TG,GT

"insert mode remap
inoremap AA <Esc>A
inoremap WW <Esc>:w<cr>
inoremap ZZ <Esc>:wq

"Window Colemak
nnoremap <localleader>w <C-W>

noremap § U
noremap ± 
nnoremap : ,

"No escape
nnoremap <bs> :
noremap! <bs> <esc>

cnoremap ; !
cnoremap ! ;

"fold
noremap <localleader>a z
		
nmap gJ <C-D>
nmap gK <C-U>

command T CommandT
nnoremap <localleader>g :CommandT<cr> " t

let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
