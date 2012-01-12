set noswapfile
syntax on
"nnoremap ' `
"nnoremap ` :

let maplocalleader = " "
"Colemak remap
noremap n j
nnoremap e k
xnoremap e k "visual mode but not operator
nnoremap \ l
nnoremap l b
nnoremap u e
nnoremap j u

nnoremap k nzv
noremap K Nzv
vnoremap k n

"Insert mode remap
inoremap AA <Esc>A
inoremap WW <Esc>:w<cr>
inoremap ZZ <Esc>:wq



"Window Colemak
nnoremap <localleader>w <C-W>
nnoremap <localleader>wn <C-W>j
noremap <localleader>wl <C-W>k
nnoremap <localleader>we <C-W>l
nnoremap <localleader>wN <C-W>J
nnoremap <localleader>wL <C-W>K
nnoremap <localleader>wE <C-W>L

nmap q ]
nnoremap qq q
nnoremap QQ Q
nmap Q [

noremap § u
noremap ± 
"nnoremap ; :
"nnoremap : ;
"nnoremap , :
nnoremap : ,

"No escape
nnoremap  :
noremap!  <esc>

cnoremap ; !
cnoremap ! ;

nnoremap <s-tab> <C-O>
inoremap <s-tab> <C-O>
"fold
"nnoremap <tab> za 
"nnoremap <s-tab> zA
"
nnoremap <localleader>a z
		
nnoremap g t
nnoremap G T
nnoremap t g
nnoremap G T
nmap tt gg
nmap tn <C-D>
nmap te <C-U>

command T CommandT
nnoremap <cr> :CommandT<cr>

let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
