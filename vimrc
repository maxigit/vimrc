let mapleader = " "
let maplocalleader = ","

filetype indent on
filetype plugin on
set directory ^=~/.vim_swap//
syntax on
set spell

"basic vim setting
set modeline
set modelines=5
set number
set virtualedit=all
set nowrap

set ignorecase
set smartcase
set mouse=a
set background=dark
set backspace=2

set t_Co=256
set hidden


set switchbuf=useopen


set fillchars+=fold:\ 
nnoremap <tab> za
nnoremap <S-tab> zA

set dictionary+=/usr/share/dict/words

set listchars=tab:»\ ,eol:⇁,trail:-,nbsp:◦,extends:➤
set list
nmap <silent> <C-k>  :set nolist!<CR>
highlight NonText ctermfg=darkyellow
highlight SpecialKey ctermfg=darkyellow

noremap ' `
noremap ` :

"Colemak remap
noremap n j
nnoremap e k
xnoremap e k
nnoremap \ l
nnoremap l b
nnoremap u e
nnoremap k nzv
vnoremap k n
nnoremap j u
map E fe
map N fn

noremap K Nzv
noremap  


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


"quicklist
noremap <space>kn :cn<CR>zv
noremap <space>kN :cnf<CR>zv
noremap <space>kp :cp<CR>zv
noremap <space>kP :cpf<CR>zv
noremap <space>kl :cp<CR>zv
noremap <space>kw :cw<CR>zv
noremap <space>kc :cc<CR>zv
noremap <space>kq :ccl<CR>zv



nmap q ]
nmap Q [







nnoremap <leader>rc :Rcontroller<CR>
nnoremap <leader>rm :Rmodel<CR>
nnoremap <leader>rv :Rview<CR>
nnoremap <leader>rt :Runittest<CR>
nnoremap <leader>rf :Rfunctionaltest<CR>


noremap § u
noremap ± 
nnoremap ; :
nnoremap : ;

cnoremap ; !
cnoremap ! ;


map t g

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

