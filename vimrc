set noswapfile
syntax on
noremap ' `
noremap ` :

"Colemak remap
noremap n j
nnoremap e k
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



"Window Colemak
map <leader>w <C-W>
map <leader>wn <C-W>j
map <leader>wl <C-W>k
map <leader>we <C-W>l
map <leader>wN <C-W>J
map <leader>wL <C-W>K
map <leader>wE <C-W>L

nmap q ]
nmap Q [

noremap § u
noremap ± 
nnoremap ; :
nnoremap : ;

cnoremap ; !
cnoremap ! ;

map t g

filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

"Color
colorscheme distinguished
