let mapleader = " "
let maplocalleader = ","

filetype indent on
filetype plugin on
set directory ^=~/.vim_swap//
syntax on

"basic vim setting
set modeline
set modelines=5
set ruler
set number
set virtualedit=all

set ignorecase
set smartcase

set hidden
set tildeop


"set ht=2
"set ts=2
"set sw=2

set switchbuf=useopen


"fold setting
set foldmethod=indent
set foldlevelstart=2
set foldcolumn=0
"set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set foldtext=getline(v:foldstart).'\〚...〛\ '.getline(v:foldend).'\ '
set foldtext='✪\ '.getline(v:foldstart).'\ [...]\ '.getline(v:foldend).'\ '
map z] ]z
map z[ [z
"let ruby_fold=0
let ruby_no_comment_fold=1
set fillchars+=fold:\ 

set foldexpr=IndentFold()
set foldmethod=expr
setlocal foldtext=OneLineFold()
nnoremap G Gzv

"nnoremap <leader>a z
nnoremap zV zMzv
"nnoremap zZ vizzc<esc>

map ]] ]zzj
map [[ [z
map ]- t_
map [- T_

set tags+=../tags
set tags+=../../tags
set tags+=~/.tags/gems

set dictionary+=/usr/share/dict/words

imap ## #{}<Esc>i
map c& xPp%xPPc%

"imap () ()<esc>i
"imap [] []<esc>i
"imap {} {}<esc>i
"
imap <%% <%  %>ODODOD
imap <%= <%=  %>ODODOC


"autocmd FileType ruby set omnifunc=rubycomple#Complete
"autocmd FileType eruby set omnifunc=rubycomple#Complete
autocmd FileType ruby compiler ruby
autocmd FileType ruby noremap <leader>mr :Rake<CR>
autocmd FileType ruby noremap <leader>mm :w !ruby -c<CR>
autocmd FileType cucumber compiler cucumber

autocmd BufWritePost *.rb make -c %

cab nw noa w


set t_Co=16
hi Comment ctermbg=gray ctermfg=darkgreen
hi Statement ctermfg=blue
hi Visual ctermbg=DarkYellow
hi String ctermbg=red
hi Folded ctermfg=darkblue ctermbg=none

set hlsearch
"set incsearch

"autocmd FileType haskell ab comment s/^/--/
"autocmd FileType haskell ab ucomment s/^--//
"autocmd FileType haskell cab comments g/^[ \t]*#
"autocmd FileType haskell vmap cc :s/^/--/<cr>
"autocmd FileType haskell vmap uu :s/^--//<cr>
autocmd FileType haskell set makeprg=ghci


set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
cab marginoff set nonu; set foldcolumn=y
iab ddd debugger

"Camelcase motion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> e <Plug>CamelCaseMotion_e
map <silent> b <Plug>CamelCaseMotion_b

noremap ,w w
noremap ,b b
noremap ,e e

omap <silent> ii <Plug>CamelCaseMotion_iw
"noremap <silent> ii iw

omap <silent> <Plug>IgnoreCamelCaseMotion_iw <Plug>CamelCaseMotion_iw
"xmap <silent> <Plug>IgnoreCamelCaseMotion_iw <Plug>CamelCaseMotion_iw
"omap <silent> <Plug>IgnoreCamelCaseMotion_ib <Plug>CamelCaseMotion_ib
"xmap <silent> <Plug>IgnoreCamelCaseMotion_ib <Plug>CamelCaseMotion_ib

set listchars=tab:>-,trail:·,eol:$,precedes:>,extends:>,nbsp:.
set listchars=tab:»\ ,eol:⇁,trail:.,nbsp:.,extends:➤
set listchars=tab:»\ ,eol:⇁,trail:-,nbsp:◦,extends:➤
set list
nmap <silent> <C-k>  :set nolist!<CR>
highlight NonText ctermfg=darkyellow
highlight SpecialKey ctermfg=darkyellow

noremap ' `
noremap ` :

"movement
"noremap n j
"noremap l k
"noremap k n
"noremap j e
"noremap e l

"noremap k n
"noremap l k
"noremap n l
"
noremap n j
noremap e k
noremap \ l
noremap l b
noremap u e
noremap k nzv
noremap j u
map E fe
map N fn
noremap L [z
noremap U ]z

noremap K Nzv
noremap  
map  [5C <C-Right>
map [5D  <C-Left>
map  [5A <C-Up>
map  [5B <C-Down>

" iTerm
map  O5C <C-Right>
map O5D  <C-Left>
map  O5A <C-Up>
map  O5B <C-Down>
nnoremap <C-Right> <C-w><Right>
nnoremap <C-Left>  <C-w><Left>
nnoremap  <C-Up> <C-w><Up>
nnoremap  <C-Down> <C-w><Down>

nnoremap <M-Up> :cp<CR>
nnoremap <M-Down> :cn<CR>
nnoremap <C-Left> :colder
nnoremap <C-Right> :cnewer

let g:dbext_default_use_sep_result_buffer = 1

map <Leader>gb :GitBlame<CR>
map <leader>gB :GitBlame %<CR>

"let g:gsession_non_default_mapping = 1

"quick inserst in insert mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap WW <Esc>:w<cr>
inoremap EE <Esc>:e!
inoremap ZZ <Esc>:wq

inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u


" paste 
inoremap RR <C-R>
cnoremap RR <C-R>

"erase
inoremap XX <Esc>x

inoremap PP <Esc>:set paste<Cr>i

cnoremap <leader>be :BufExplorer<CR>+

set laststatus=2
"set statusline ="-- %{fugitive#statusLine()}"
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"au InsertEnter * hi StatusLine ctermb=0 ctermfg=2
"au InsertLeave * hi StatusLine  ctermfg=0 ctermbg=2 
hi CursorLine ctermbg=green cterm=none

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

"Window
map <leader>w <C-W>
map <leader>wn <C-W>j
map <leader>wl <C-W>k
map <leader>we <C-W>l
map <leader>wN <C-W>J
map <leader>wL <C-W>K
map <leader>wE <C-W>L

"Tab
noremap <leader>tn :tabp<cr>
noremap <leader>te :tabn<cr>
noremap <leader>tt :tabnew<cr>
noremap <leader>tq :tabclose<cr>

"quicklist
noremap <space>kn :cn<CR>zv
noremap <space>kN :cnf<CR>zv
noremap <space>kp :cp<CR>zv
noremap <space>kP :cpf<CR>zv
noremap <space>kl :cp<CR>zv
noremap <space>kw :cw<CR>zv
noremap <space>kc :cc<CR>zv
noremap <space>kq :ccl<CR>zv
noremap <space>Cn :cn<CR>zv
noremap <space>Cp :cp<CR>zv
noremap <space>Cl :cp<CR>zv
noremap <space>Cw :cw<CR>zv
noremap <space>Cc :cc<CR>zv
noremap <space>Cq :ccl<CR>zv

inoremap 3# ###
inoremap 4# ####
inoremap 5# #####

"Ack
set grepprg=ack

"Furry finder
noremap <leader>fb :FufBuffer<Cr>
noremap <leader>ff :FufFile<Cr>
noremap <leader>fj :FufJumpList<Cr>
noremap <leader>fq :FufQuickList<Cr>
noremap <leader>ft :FufTag<Cr>
noremap <leader>fd :FufDirectory<Cr>
noremap <leader>fq :FufQuickfix<Cr>
noremap <leader>fc :FufLine<Cr>
 

"file completions
set wildmenu
set wildmode=longest:full,full
"oset wildignore=*.hs
set suffixes+=.hi

"cab mma w %<CR>:make %<CR>
"spelling mistake
iab lenght length

"navigation
nnoremap UU <C-u>
nnoremap FF <C-d>


nmap WW <space>SS:qa<Cr>
nmap <leader>ee :NERDTree<cr>
nnoremap <leader>et :TlistToggle<CR><C-W>h

"diff syntax
hi DiffAdd ctermbg=green
hi DiffText ctermbg=yellow




" Java
function SetAnt()
  set makeprg=vimAnt
  set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\ \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
endfunction

set undofile
set undodir=~/.vim/undo

"set completeopt=menuone,preview,longest
set completeopt=menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Omni completion settings
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

set complete=.,b
hi Pmenu ctermbg=gray ctermfg=darkblue
hi PmenuSel ctermbg=Yellow ctermfg=darkblue

nnoremap <silent>  <C-K><C-K> :set spell!<CR>

inoremap <Tab>l <C-X><C-L>
inoremap <Tab>n <C-X><C-O>
inoremap <Tab>s <C-X><C-S>
set ph=10
nnoremap <leader>SQ <space>SS:xa

"macro and makeprg
nnoremap <leader>mm :w<CR>:make %<CR>
nnoremap <leader>bb :b#<CR>

"let Tlist_Show_One_File=1
nnoremap <leader>rc :Rcontroller<CR>
nnoremap <leader>rm :Rmodel<CR>
nnoremap <leader>rv :Rview<CR>
nnoremap <leader>rt :Runittest<CR>
nnoremap <leader>rf :Rfunctionaltest<CR>

function MyPaste()
  let s:c = getchar()
  normal "\""+c
endfunction
"easy paste
noremap <leader>pi ".p
noremap <leader>pd "-p
noremap <leader>pP P
noremap <leader>pi ".P
noremap <leader>pI ".P
noremap <leader>pD "-P

noremap § u
noremap ± 

set sessionoptions-=options
set sessionoptions+=buffers


cab gems /Users/mb14/.rvm/gems/ruby-1.8.7-p174@sequencescape/gems

command Bdiff w !diff % -



function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"cab ccd cd %:p:h
"cab ccd lcd %:p:h
hi DiffText ctermbg=darkmagenta ctermfg=gray

cmap <C-r>$ %:p:h
cab ee drop %:p:h
cab er edit ~/


call pathogen#runtime_append_all_bundles( )

"let g:org_todo_setup= 'TODO | STARTED | DONE | WISH'
let g:agenda_dirs = ["~/Dropbox/org"]
let g:org_tag_setup='{@home(h) @work(w) @Ellie(u) } \n { Ellie(e) Sheena(s)  } \n {easy(y) hard(d)} \n {computer(c) phone(p) internet(i)}'
" leave these as is:
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufRead,BufNewFile *.org            call org#SetOrgFileType()
au BufRead *.org :PreLoadTags
au BufWrite *.org :PreWriteTags
au BufWritePost *.org :PostWriteTags
" to help for git. we need to be in the good directory
"au FileType org :lcd %:p:h

" various text item highlightings are below
hi Properties guifg=pink ctermfg=darkred
hi Tags guifg=pink ctermbg=lightred
hi Dates guifg=magenta ctermfg=darkmagenta
hi stars guifg=#444444 ctermfg=gray
hi Props guifg=#ffa0a0 ctermfg=darkred
hi code guifg=orange gui=bold ctermbg=14
hi itals gui=italic guifg=#aaaaaa ctermbg=lightgray
hi boldtext gui=bold guifg=#aaaaaa ctermbg=lightyellow
hi undertext gui=underline guifg=#aaaaaa cterm=underline
hi lnumber guifg=#999999 ctermfg=gray
hi OL1 guifg=#7744ff ctermfg=darkblue
hi OL2 guifg=#aaaa22 ctermfg=darkgreen
hi OL3 guifg=#00ccff ctermfg=darkcyan
hi OL4 guifg=#999999 gui=italic  	ctermfg=darkred
hi OL5 guifg=#eeaaee ctermfg=darkmagenta
hi OL6 guifg=#9966ff 	ctermfg=darkyellow
hi OL7 guifg=#dd99dd  	ctermfg=black
hi OL8 guifg=cyan	ctermfg=grey
hi OL9 guifg=magenta	ctermfg=blue
hi OL1 cterm=underline
hi OL2 cterm=underline
hi OL3 cterm=underline
"hi OL4 cterm=underline
"hi OL5 cterm=underline
"hi OL6 cterm=underline
"hi OL7 cterm=underline
"hi OL8 cterm=underline
"hi OL9 cterm=underline
"hi OL1 ctermbg=gray
"hi OL2 ctermbg=gray
"hi OL3 ctermbg=gray
"hi OL4 ctermbg=gray
"hi OL5 ctermbg=gray
"hi OL6 ctermbg=gray
"hi OL7 ctermbg=gray
"hi OL8 ctermbg=gray
"hi OL9 ctermbg=gray
"hi FoldText ctermbg=gray
hi TODO ctermfg=darkred ctermbg=none cterm=bold
hi link CANCELED DONE
hi STARTED ctermfg=blue ctermbg=none cterm=bold
hi link NEXT TODO
hi DONE ctermfg=darkgreen ctermbg=none cterm=bold
