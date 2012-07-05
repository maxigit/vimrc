set noswapfile
syntax on
set rnu
set modeline
set sessionoptions=options,localoptions,sesdir
set hidden

set secure
set exrc

"wildmode
set wildmenu
set wildmode=longest:full,full
set wildmode=full
"cnoremap <C-N> <C-P>
cnoremap <C-O> <C-P>
"cnoremap <C-P> <C-N>


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
nnoremap <bs> :
noremap! <bs> <esc>

cnoremap ; !
cnoremap ! ;


"undo easier
nnoremap g= g+
"fold
noremap <localleader>a z
		
nmap <localleader>j <C-D>
nmap <localleader>k <C-U>

command T CommandT
nnoremap <localleader>g :CommandT<cr> " t


let maplocalleader = ","
filetype plugin indent on
runtime bundle/vim-unbundle/unbundle.vim

if exists("$VIM_CS")
	execute "colorscheme ".$VIM_CS
else
"Color
"colorscheme distinguished
colorscheme solarized
" Cursor lines
endif
if exists("$VIM_BG")
	let &bg=$VIM_BG
else
set bg=light
end
au WinEnter * set cursorcolumn cursorline
au WinLeave * set nocursorcolumn nocursorline
set cursorcolumn cursorline
"hi CursorLine ctermbg=NONE cterm=underline
"hi CursorColumn ctermbg=NONE cterm=bold ctermfg=black
"
nnoremap <silent> <C-n> :exe '/\%'.col(".").'c\w'<CR>
nnoremap <silent> <C-e> :exe '?\%'.col(".").'c\w'<CR>
nnoremap <silent> <C-n> :exe '/^\s*\%'.col(".").'c\zs\w'<CR>
nnoremap <silent> <C-e> :exe '?^\s*\%<'.col(".").'c\W\zs\w'<CR>

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
" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
