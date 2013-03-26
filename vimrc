set noswapfile
"syntax on
set rnu
set modeline
set hidden

set ts=2
set sts=2
set sw=2

set laststatus=2

set secure
set exrc

"wildmode
set wildmenu
set wildmode=longest:full,full
set wildmode=full
cnoremap <C-O> <C-P>


set virtualedit=all
set cc=+1,+2,+3
set ruler
"undo
set undofile
set undodir=~/.vim/undo 
set undolevels=100

let maplocalleader = " "
"Colemak remap
set langmap=njuek;juekn,NJUEK;JUEKN "same as above but
set langmap+=tg,gt,TG,GT
set langmap+='`,`'

"insert mode remap
inoremap AA <Esc>A
inoremap WW <Esc>:w<cr>
inoremap ZZ <Esc>:wq

"Window Colemak
nnoremap <localleader>w <C-W>

"No escape
nnoremap  :
noremap!  <esc>

"cnoremap ; !
"cnoremap ! ;


"undo easier
nnoremap g= g+
"fold

set foldlevel=3
set fillchars+=fold:\ 
au ColorScheme * hi clear Folded
au ColorScheme * hi link Folded Macro
set foldtext=getline(v:foldstart).'[...]'.getline(v:foldend).'\ '

nmap <localleader>j <C-D>
nmap <localleader>k <C-U>

"ctrl 
nnoremap <silent> <localleader>p :CtrlP<CR>

let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

set t_Co=256
let g:solarized_termcolors=256
if exists("$VIM_CS")
	execute "colorscheme ".$VIM_CS
else
"Color
"colorscheme distinguished
"colorscheme solarized
colorscheme default
endif
if exists("$VIM_BG")
	let &bg=$VIM_BG
else
set bg=light
end
if exists("$VIM_TBG")
	execute "hi Normal ctermbg=".$VIM_TBG
endif
if exists("$VIM_TFG")
	execute "hi Normal ctermfg=".$VIM_TFG
endif
" Cursor lines
au WinEnter * set cursorcolumn cursorline
au WinLeave * set nocursorcolumn nocursorline
set cursorcolumn cursorline
hi clear CursorLine
hi link CursorLine Search

" Add C-u to remove initial range "<,>" set by typing ':'
noremap <silent> <C-n> :<C-u>exe '/\%'.col(".").'c\w'<CR>
noremap <silent> <C-e> :<C-u>exe '?\%'.col(".").'c\w'<CR>
noremap <silent> <C-n> :<C-u>exe '/^\s*\%'.col(".").'c\zs\w'<CR>
noremap <silent> <C-e> :<C-u>exe '?^\s*\%<'.col(".").'c\W\zs\w'<CR>

hi TrailingSpaces cterm=reverse ctermfg=red
au BufNew * call matchadd('TrailingSpaces', '\S\zs\s\+$')

hi Wildmenu ctermfg=13

"remap for right contraol
cnoremap <C-y> <C-w>
cnoremap <C-'> <C-r>
"set list
"set listchars=trail:_
"
command Wc w !pbcopy

nmap  :Ggrep /\<\><cr>

" vertical separator 
"set fillchars=vert:|,fold:-
hi VertSplit ctermbg=NONE  ctermfg=10

" resize windows when resizing vim
autocmd VimResized * normal =

