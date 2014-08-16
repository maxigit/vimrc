set noswapfile
"syntax on
set rnu
set nu
set modeline
set hidden

set ts=4
set sts=4
set sw=4
set smarttab
set expandtab

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
"set langmap+='`,`'

"insert mode remap
inoremap AA <Esc>A
inoremap WW <Esc>:w<cr>
inoremap ZZ <Esc>:wq

"Window Colemak
nnoremap <localleader>w <C-W>

"No escape
nnoremap <C-C> :
"noremap <C-C> <C-O>
inoremap <C-O> <C-C>
nnoremap <esc> :

nnoremap : ,
nnoremap , :


"cnoremap ; !
"cnoremap ! ;


"undo easier
nnoremap g= g+
"fold

set foldlevel=3
set fillchars+=fold:\ 
au ColorScheme * hi clear Folded
au ColorScheme * hi link Folded Macro
au ColorScheme * hi Normal ctermfg=black
set foldtext=getline(v:foldstart).'[...]'.getline(v:foldend).'\ '

nmap <localleader>j <C-D>
nmap <localleader>k <C-U>

"ctrl 
nnoremap <silent> <localleader>p :CtrlP<CR>

let maplocalleader = ":"
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
"colorscheme default
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
colorscheme github
" Cursor lines
"au WinEnter * set cursorcolumn cursorline
"au WinLeave * set nocursorcolumn nocursorline
"set cursorcolumn cursorline
"hi clear CursorLine
"hi CursorLine cterm=underline
"hi link CursorLine Search

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

"au ColorScheme * hi clear PreProc
"au ColorScheme * hi link PreProc Statement
"au ColorScheme * hi clear Statement
"au ColorScheme * hi clear Identifier
"au ColorScheme * hi clear Special
""au ColorScheme * hi clear Constant
"au ColorScheme * hi clear Type
"au ColorScheme * hi clear Comment
"au ColorScheme * hi Constant ctermfg=blue
"au ColorScheme * hi link Comment String
"au ColorScheme * hi clear Lever16c 
au ColorScheme * hi clear VertSplit
au ColorScheme * hi link VertSplit StatusLineNC
hi clear VertSplit
hi link VertSplit StatusLineNC


let g:haddock_browser="/Application/Firefox"
inoremap PP <C-r>"



nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]Q :cnf<CR>
nnoremap [Q :cpf<CR>


"\   'operators': '_[^(){}[\]]_',
"\   'operators': '_[,;$%@#&:+=!\-<>*.]_',

"autocmd BufEnter *.hs compiler ghc
let g:rainbow_active=0
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['blue', 'magenta', 'red', 'brown', 'green', 'cyan'],
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}'], ['\$', '$']],
\   'operators': '_[^(){}[\]]_',
\   'separately': {
\       '*': {},
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
\       },
\       'html': {
\           'operators': '',
\           'parentheses': [['(',')'], ['\[','\]'], ['{','}'], ['<\a[^>]*[^/]>\|<\a>','</[^>]*>']],
\       },
\       'tex': {
\           'operators': '',
\           'parentheses': [['(',')'], ['\[','\]']],
\       },
\   }
\}

