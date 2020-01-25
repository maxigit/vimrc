set hidden
set exrc
set secure
" Undo
set undofile
set undodir=$HOME/.vim/undo
set history=10000
" Tab
set expandtab
set tabstop=2
set shiftwidth=2
set termguicolors
"set bg=light
"color parchment
"let ayucolor="mirage"
"color ayu
set clipboard=unnamedplus

set bg=light
"autocmd  ColorScheme * hi Folded guibg=Yellow guifg=black
"autocmd  ColorScheme * hi Folded guibg=NONE guifg=black
autocmd  ColorScheme * hi Folded guibg=#dddddd guifg=blue
autocmd  ColorSchemePre ayu let g:ayucolor="light"
autocmd ColorScheme * hi StatusLineNC guibg=orange guifg=black
autocmd ColorScheme * hi StatusLine guibg=black guifg=orange
color gruvbox
"color flattened_light
set wildmode=list:longest,full
set tags+=tags;~ " search tag files upward
"=============
set modeline
"=========== Syntax
syntax on
filetype plugin indent on
" Haskell
"autocmd FileType haskell setlocal includeexpr=substitute(v:fname,'\\.','/','g') 
"autocmd FileType haskell setlocal suffixesadd=.hs,.lhs
"autocmd FileType haskell setlocal include=import
""autocmd FileType haskell let &l:define='^\(\s*\ze\i\+\s*\(::\|.*=\|<-\)\|data\s*\|type\s*\|newtype\s*\)'
"autocmd FileType haskell let &l:define='^\(data\s*\|type\s*\|newtype\s*\|\s*\ze\i\+\s*\(::\|.*\s=\|<-\)\)'
" PHP
"autocmd FileType php let &errorformat=&errorformat:'Parse error:\ %m in ./modules/%*[^/]/%f on line %l'
autocmd FileType php setlocal includeexpr=substitute(v:fname,'^/','','') 
autocmd FileType php setlocal suffixesadd=.php,.inc

" set complete=.,i,w " current buffer and words in included files
set completeopt=menu,longest,preview
"===========
let mapleader = " "
let maplocalleader = ","

nnoremap <space>eb :make %.check<CR>
nnoremap <space>en :cn<CR>
nnoremap <space>eN :cp<CR>
nnoremap <space>ep :cp<CR>
nnoremap <space>ee :cc<CR>
nnoremap <space>el :cw<CR>
nnoremap <space>e. :cnf<CR>
nnoremap <space>e, :cpf<CR>
nnoremap <space>eo :execute "edit! + ".&errorfile<CR>

nnoremap <space>fs :w<CR>
nnoremap <space>fq :x<CR>
" fuzzy finder
source /usr/share/vim/vimfiles/plugin/fzf.vim
"nnoremap <space>ff :FZF<CR>
nnoremap <space>ff :Files<CR>
nnoremap <space>fv :FZF ~/.vim<CR>
nnoremap <space>fg :GFiles!<CR>
nnoremap <space>bb :Buffers<CR>
nnoremap <space>bq :q<CR>
nnoremap <space>fc :Colors!<CR>
nnoremap <space>ft :Tags<CR>
nnoremap <space>fT :Tags <C-R><C-W><CR>
nnoremap <space>fh :Helptags!<CR>
nnoremap <space>fr :History<CR>
nnoremap <space>f: :Commands<CR>
nnoremap <space>; :History:<CR>
nnoremap <space>f/ :History/<CR>
nnoremap <space>fm :Marks<CR>
nnoremap <space>f<space> :Maps<CR>
nnoremap <space>fy :Filetypes<CR>
nnoremap <space>ss :BLine<CR>
nnoremap <space>sS :BLine <C-R><C-W><CR>
nnoremap <space>Ss :Line<CR>
nnoremap <space>SS :Line <C-R><C-W><CR>
nnoremap <space>sq :g/\<<C-R><C-W>\>/laddexpr expand("%") . ":" . line(".") . ":" .  getline(".")<CR>:lopen<CR>
" Using foldutil
nnoremap <space>z* :FoldMatching! \<<C-R><C-A>\> 0<CR>*
nnoremap <space>z/ :FoldMatching! // 0<CR>*
" outlines
nnoremap <space>zo :FoldMatching ^<C-R><C-A> -1<CR>
nnoremap <space>zs :folddo s/
" create fold within quickfix window
nnoremap <space>zq :FoldMatching ^[^\|] -1<CR>
" creates folds to hide (or not) quickfiixes
nnoremap <space>zl :FoldLMisses<CR>
nnoremap <space>zc :FoldMisses<CR>
nnoremap z* :folddo s/\<C-R>C-W>\><CR>



"nnoremap <space><space> :Commands<CR>
nnoremap <space>: :Commands<CR>

nnoremap <space>/ :Rg <CR>
nnoremap <space>* :Rg <C-R><C-W><CR>

"tig
nnoremap <space>gs :Tig status<CR>
nnoremap <space>gb :TigBlame<CR>
nnoremap <space>gf :Tig %<CR>
nnoremap <space>gc :Commits
nnoremap <space>gS :GFiles?
nnoremap <space>gh :BCommits

"ranger
let g:ranger_map_keys = 0
nnoremap <space>ar :Ranger<CR>
nnoremap <space>ad :RangerWorkingDirectory<CR>

"neoterm
nnoremap <space>' :Ttoggle<CR>
tnoremap <esc> <C-W>N
tnoremap <C-W><esc> <esc>

tnoremap <Left> <C-W><Left>
tnoremap <C-W><Left> <Left>
tnoremap <Right> <C-W><Right>
tnoremap <C-W><Right> <Right>
tnoremap <Up> <C-W><Up>
tnoremap <C-W><Up> <Up>
tnoremap <Down> <C-W><Down>
tnoremap <C-W><Down> <Down>


" ====Preview & Tag
"
nnoremap <space>pt :ptag <C-R><C-W><CR>
nnoremap <space>pp :ptprevious<CR>
nnoremap <space>pn :ptnext<CR>
nnoremap <space>po :ppop<CR>
nnoremap <space>pq :pc<CR>
nnoremap <space>pi :psearch <C-R><C-W><CR>

nnoremap <space>lo :lopen<CR>
nnoremap <space>lq :lclose<CR>
nnoremap <space>l< :lrewind<CR>
nnoremap <space>l> :llast<CR>
nnoremap ]l :lnext<CR>
nnoremap ]L :lnfile<CR>
nnoremap [l :lprev<CR>
nnoremap [L :lpfile<CR>
nnoremap ]w :lnext<CR>
nnoremap ]W :lnfile<CR>
nnoremap [w :lprev<CR>
nnoremap [W :lpfile<CR>

nnoremap <space>co :copen<CR>
nnoremap <space>cq :cclose<CR>
nnoremap <space>c< :crewind<CR>
nnoremap <space>c> :clast<CR>
"nnoremap <space>cc :cc<CR>
nnoremap ]q :cnext<CR>
nnoremap ]Q :cnfile<CR>
nnoremap [q :cprev<CR>
nnoremap [Q :cpfile<CR>

nnoremap <space>eb :make %.check<CR>
nnoremap <space>en :cn<CR>
nnoremap <space>eN :cp<CR>
nnoremap <space>ep :cp<CR>
nnoremap <space>ee :cc<CR>
nnoremap <space>el :cw<CR>
nnoremap <space>e. :cnf<CR>
nnoremap <space>e, :cpf<CR>
" Reload
nnoremap <space>fed :e ~/.vim/vimrc<CR>
nnoremap <space>fer :so ~/.vim/vimrc<CR>
nnoremap <Tab> za
nnoremap <S-Tab> zA

" DB profile
let g:dbext_default_profile_prod = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=3016'
let g:dbext_default_profile_warehouse = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=warehouse:port=3016'
let g:dbext_default_profile_stag = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=3308'
let g:dbext_default_profile_hot = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=4016'
let g:dbext_default_profile_dc = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=commerce:port=3006'
let g:dbext_default_profile_dc2 = 'type=mysql:host=127.0.0.1:user=root:passwd=dc-dev:dbname=commerce:port=5016'
let g:dbext_default_profile_dcprod = 'type=mysql:host=dec.shop.mae.uk0.bigv.io:user=warrior:passwd=@askg:dbname=commerce:port=3306'
let g:dbext_default_profile_prod_all = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=@askg:port=3016'

" Org mode
" hide stars
let g:org_heading_shade_leading_stars=0



" form VIM tips

if ! exists('g:foldmisses_context')
  let g:foldmisses_context = 0
endif

" Add manual fold from line1 to line2, inclusive.
function! s:Fold(line1, line2)
  if a:line1 < a:line2
    execute a:line1.','.a:line2.'fold'
  endif
endfunction

" Return list of line numbers for current buffer found in quickfix list.
function! s:GetHitLineNumbers(list)
  let result = []
  for d in a:list
    if d.valid && d.bufnr == bufnr('')
      call add(result, d.lnum)
    endif
  endfor
  return result
endfunction

function! s:FoldMisses(list, context)
  setlocal foldmethod=manual
  normal! zE
  let extra = a:context == 99999 ? g:foldmisses_context : a:context
  let last = 0
  for lnum in s:GetHitLineNumbers(a:list)
    let start = last==0 ? 1 : last+1+extra
    call s:Fold(start, lnum-1-extra)
    let last = lnum
  endfor
  call s:Fold(last+1+extra, line('$'))
endfunction

":[N]FoldMisses [N]     Show only the lines (and surrounding [N] lines
":[N]FoldLMisses [N]    of context) in the current buffer that appear
"                       in the quickfix / location list.
"                       Missed, error-free lines are folded away.
command! -bar -count=99999 FoldMisses call s:FoldMisses(getqflist(), <count>)
command! -bar -count=99999 FoldLMisses call s:FoldMisses(getloclist(0), <count>)

" extra plugin
packadd quickfixsigns_vim
packadd cfilter

" ctrlspace
let g:CtrlSpaceDefaultMappingKey = "<space>w"
packadd vim-ctrlspace
packadd vim-dispatch
packadd vim-tbone

let g:dispatch_pane = "+"
nnoremap <space>rr :call tbone#send_keys(g:dispatch_pane, ":r\n")<CR>
nnoremap <space>rb :call tbone#send_keys(g:dispatch_pane, ":l " . expand("%:p")."\n")<CR>
nnoremap <space>rc :call tbone#send_keys(g:dispatch_pane, ":set +c\n:l " . expand("%:p")."\n")<CR>
nnoremap <space>rt :call tbone#send_keys(g:dispatch_pane, ":t " . expand("<cword>")."\n")<CR>
nmap <space>rT viw<space>rtv
nmap <space>rU viw<space>ruv
nmap <space>rL viw<space>rlv
nnoremap <space>ri :call tbone#send_keys(g:dispatch_pane, ":i " . expand("<cword>")."\n")<CR>
nnoremap <space>rs :AbortDispatch<CR>
nnoremap <space>ro :Copen<CR>:cc<CR>

"nnoremap <space>z0 :echo 'Cfilter /\%>' . getline('.') . "l/"
autocmd FileType qf nnoremap <buffer> <space>c0 :Cfilter! /.*/<CR>
autocmd FileType qf nnoremap <buffer> <space>l0 :Lfilter! /.*/<CR>

highlight blue ctermbg=blue guibg=blue
highlight pink ctermbg=lightred guibg=lightred
highlight yellow ctermbg=yellow guibg=yellow
highlight red ctermbg=red guibg=red
highlight green ctermbg=green guibg=green
highlight cyan ctermbg=cyan guibg=cyan


vnoremap <space>rt :call Haskell_type_at("type-at")<CR>gv
vnoremap <space>ru :call Haskell_type_at("uses")<CR>gv
vnoremap <space>rl :call Haskell_type_at("loc-at")<CR>gv

function Haskell_type_at(mode) range
  " mode can be type-at uses loc-at
  let l:command = printf (":%s %s %d %d %d %d\n",a:mode,  expand("%:p"), line('.'), col("'<"), line("'>"), col("'>")+1)
  call tbone#send_keys(g:dispatch_pane, l:command)
  "execute "edit! +" . &errorfile
endfunction

" easy motion
map <space><space> <Plug>(easymotion-s2)
imap <C-F> <esc>byle:<C-u>call EasyYank()<CR>
"
"
"echo sp
"
vmap <CR> ygi<C-R>0
function! EasyYank()
  call EasyMotion#S(2,0,2)
  execute "normal ve"
endfunction


let g:context_highlight_normal = 'yellow'
packadd context.vim
