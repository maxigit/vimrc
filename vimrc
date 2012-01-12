set noswapfile
syntax on
noremap ' `
noremap ` :
let maplocalleader = " "
"Colemak remap
noremap n j
nnoremap e k
xnoremap e k //visual mode but not operator
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
map <localleader>w <C-W>
map <localleader>wn <C-W>j
map <localleader>wl <C-W>k
map <localleader>we <C-W>l
map <localleader>wN <C-W>J
map <localleader>wL <C-W>K
map <localleader>wE <C-W>L

nmap q ]
nnoremap qq q
nnoremap QQ Q
nmap Q [

noremap § u
noremap ± 
nnoremap ; :
nnoremap : ;

cnoremap ; !
cnoremap ! ;

map t g
nmap tn <C-D>
nmap te <C-U>

filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
