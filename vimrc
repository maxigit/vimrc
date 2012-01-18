set noswapfile
syntax on
"nnoremap ' `
"nnoremap ` :

let maplocalleader = " "
"Colemak remap
"noremap n j
"noremap e k
set langmap=nj,NJ,ek,EK,je,JE,kn,KN
"
"noremap j e
"noremap J E
"
"nnoremap k nzv
"noremap k nzv
"vnoremap k n

"insert mode remap
inoremap AA <Esc>A
inoremap WW <Esc>:w<cr>
inoremap ZZ <Esc>:wq



"Window Colemak
nnoremap <localleader>w <C-W>
"nnoremap <localleader>wn <C-W>j
"noremap <localleader>wl <C-W>k
"nnoremap <localleader>we <C-W>l
"nnoremap <localleader>wN <C-W>J
"nnoremap <localleader>wL <C-W>K
"nnoremap <localleader>wE <C-W>L
"
"nmap q ]
"nnoremap qq q
"nnoremap QQ Q
"nmap Q [

noremap § U
noremap ± 
"nnoremap ; :
"nnoremap : ;
"nnoremap , :
nnoremap : ,

"No escape
nnoremap <bs> :
noremap! <bs> <esc>

cnoremap ; !
cnoremap ! ;

nnoremap <s-tab> <C-O>
inoremap <s-tab> <C-O>
"fold
"nnoremap <tab> za 
"nnoremap <s-tab> zA
"
noremap <localleader>a z
		
"map t g
"nnoremap \t t
"nnoremap tt gg
set langmap+=tg,gt,TG,GT
nmap gJ <C-D>
nmap gK <C-U>

command T CommandT
nnoremap <localleader>g :CommandT<cr> " t

let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
