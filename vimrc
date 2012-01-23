set noswapfile
syntax on
set rnu
set modeline

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

map § <C-R>

"No escape
nnoremap <bs> :
noremap! <bs> <esc>

cnoremap ; !
cnoremap ! ;

"fold
noremap <localleader>a z
		
nmap <localleader>j <C-D>
nmap <localleader>k <C-U>

command T CommandT
nnoremap <localleader>g :CommandT<cr> " t

let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
