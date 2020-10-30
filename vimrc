set hidden
set exrc
set secure
" Undo
set undofile
set undodir=$HOME/.vim/undo
set history=10000

" no swap, we don't need it, 
" but we leave it, so that we know if we are editing the same file twice
set directory=/tmp//
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
set incsearch
set hls
set ruler
"set switchbuf=usetab,uselast
set smartcase
"set ignorecase
"set gdefault " add /g to substitute
set ai
set virtualedit=all

set foldopen-=search
" wrapping
set breakindent " indent wrapped line
set linebreak " break wrapped line between word
set showbreak=...\ 
set breakindentopt=sbr,shift:2

set bg=light
"autocmd  ColorScheme * hi Folded guibg=Yellow guifg=black
"autocmd  ColorScheme * hi Folded guibg=NONE guifg=black
" autocmd  ColorScheme * hi Folded guibg=#dddddd guifg=blue
"autocmd ColorScheme * hi! link Folded StorageClass
autocmd  ColorSchemePre ayu let g:ayucolor="light"
autocmd ColorScheme gruvbox hi StatusLineNC guibg=orange guifg=black
autocmd ColorScheme gruvbox hi StatusLine guibg=black guifg=orange
autocmd ColorScheme gruvbox hi IncSearch guifg=green guibg=black
autocmd ColorScheme gruvbox hi Search guifg=yellow guibg=black
autocmd ColorScheme gruvbox hi Visual cterm=None gui=None guibg=orange

autocmd ColorScheme * hi StatusLineNC guibg=orange guifg=black
autocmd ColorScheme * hi StatusLine guibg=black guifg=orange
autocmd ColorScheme yui hi Visual cterm=None gui=None guibg=orange
autocmd ColorScheme PaperColor hi String guibg=#cceecc
autocmd ColorScheme yui hi String guibg=#eecccc

let g:yui_emphasized_comments = 1
if has("gui_running")
  color gruvbox
else
  "color yui
  color PaperColor
endif
"color flattened_light
set wildmode=list:longest,full
set tags+=.tags;~,tags;~ " search tag files upward
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
nnoremap <space>fS :wall!<CR>
nnoremap <space>fq :x<CR>
nmap <space>fw :wall!<CR><space>rr
nmap <space>fW :wall!<CR><space>rC<space>rr
" fuzzy finder
source /usr/share/vim/vimfiles/plugin/fzf.vim
let g:fzf_buffers_jump=1
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview("right"), <bang>0)
"
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview("right"), <bang>0)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-o': 'sbuffer',
      \ 'ctrl-y': 'r !echo',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'down': '~50%'}
"let g:fzf_layout = {'window': '30new'}

let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <space>w <C-W>

nnoremap <space>ff :Files<CR>
nnoremap <space>fF :FZF ~<CR>
"nnoremap <space>fv :FZF ~/.vim/<CR>
nnoremap <space>fv :call fzf#run(fzf#wrap({'source':'find ~/.vim'}))<CR>
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
nnoremap <space>W :Windows<CR>
nnoremap <space>f/ :History/<CR>
nnoremap <space>f' :Marks<CR>
nnoremap <space>fq :Quickfick<CR>
nnoremap <space>fl :Quickfick!<CR>
"nnoremap <space>f<space> :Maps<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <space>fy :Filetypes<CR>
nnoremap <space>ss :BLine<CR>
nnoremap <space>sS :BLine <C-R><C-W><CR>
nnoremap <space>Ss :Line<CR>
nnoremap <space>SS :Line <C-R><C-W><CR>
nnoremap <space>sq :g/\<<C-R><C-W>\>/laddexpr expand("%") . ":" . line(".") . ":" .  getline(".")<CR>:lopen<CR>
nnoremap <space>sQ :g//laddexpr expand("%") . ":" . line(".") . ":" .  getline(".")<CR>:lopen<CR>
nnoremap <space>sc :noh<CR>
" Using foldutil
nnoremap <space>z* :FoldMatching! \<<C-R><C-A>\> 0<CR>*
nnoremap <space>z/ :FoldMatching! <C-R>/ 0<CR>
" outlines
nnoremap <space>zo :FoldMatching ^<C-R><C-A> -1<CR>
nnoremap <space>zs :folddo s/
" create fold within quickfix window
nnoremap <space>zq :FoldMatching ^[^\|] -1<CR>
" creates folds to hide (or not) quickfiixes
nnoremap <space>zl :FoldLMisses<CR>
nnoremap <space>zc :FoldMisses<CR>
nnoremap z* :folddo s/\<C-R>C-W>\><CR>

nnoremap <silent> <space>zmi :set foldmethod=indent<CR>
nnoremap <silent> <space>zmm :set foldmethod=manual<CR>
nnoremap <silent> <space>zme :set foldmethod=expr<CR>
nnoremap <silent> <space>zmk :set foldmethod=marker<CR>
nnoremap <silent> <space>zk :hi! Folded guibg=NONE guifg=black<CR>
nnoremap <silent> <space>zn :hi! Folded guibg=NONE guifg=NONE<CR>
nnoremap <silent> <space>zy :hi! Folded guibg=yellow guifg=black<CR>
nnoremap <silent> <space>zb :hi! Folded guibg=#dddddd guifg=blue<CR>
nnoremap <silent> <space>zo :hi! link Folded StorageClass<CR>




"nnoremap <space><space> :Commands<CR>
nnoremap <space>: :Commands<CR>

nnoremap <space>/ :Rg! <CR>
nnoremap <space>* :Rg! <C-R><C-W><CR>

"tig
let g:tig_explorer_use_builtin_term=0
nnoremap <silent> <space>gs :Tig status<CR>
nnoremap <silent> <space>gb :TigBlame<CR>
nnoremap <silent> <space>gf :TigOpenCurrentFile<CR>
nnoremap <silent> <space>gc :Commits
nnoremap <silent> <space>gS :GFiles?!
nnoremap <silent> <space>gh :BCommits
" Gitt gutter
nnoremap <silent> <space>gw :let g:gitgutter_diff_relative_to= 'working_tree'<CR>
nnoremap <silent> <space>gi :let g:gitgutter_diff_relative_to= 'index'<CR>
nnoremap <silent> <space>gh :GitGutterLineHighlightsToggle<CR>
" fold git diff
nnoremap <silent> <space>gz :GitGutterFold<CR>
nnoremap <silent> <space>gS :GitGutterStageHunk<CR>
nnoremap <silent> <space>gU :GitGutterUndoHunk<CR>
nnoremap <silent> <space>gv :GitGutterPreviewHunk<CR>
nnoremap <silent> <space>ga :!git add -e<CR>
nnoremap <silent> <space>gg :!git 
nnoremap <silent> <space>gn :GitGutterNextHunk<CR>
nnoremap <silent> <space>gp :GitGutterPrevHunk<CR>
nnoremap <silent> <space>gq :GitGutterQuickFix<CR>

"ranger
let g:ranger_map_keys = 0
nnoremap <space>ar :Ranger<CR>
nnoremap <space>ad :RangerWorkingDirectory<CR>

"neoterm
nnoremap <space>' :Ttoggle<CR>
"tnoremap <esc> <C-W>N
"tnoremap <C-W><esc> <esc>

"tnoremap <Left> <C-W><Left>
"tnoremap <C-W><Left> <Left>
"tnoremap <Right> <C-W><Right>
"tnoremap <C-W><Right> <Right>
"tnoremap <Up> <C-W><Up>
"tnoremap <C-W><Up> <Up>
"tnoremap <Down> <C-W><Down>
"tnoremap <C-W><Down> <Down>


" ====Preview & Tag
"
nnoremap <space>pt :ptag <C-R><C-W><CR>
nnoremap <space>pp :ptprevious<CR>
nnoremap <space>pn :ptnext<CR>
nnoremap <space>po :ppop<CR>
nnoremap <space>pq :pc<CR>
nnoremap <space>pi :psearch <C-R><C-W><CR>
nnoremap <space>pe :noa pedit<CR>
nnoremap <space>tp :set previewwindow!<CR>


nnoremap <space>lo :botright lopen<CR>
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

nnoremap <space>co :botright copen<CR>
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
"nnoremap <Tab> za
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
let g:dbext_default_profile_psql = 'type=PGSQL::user=max:dbname=sese-website'

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
let g:CtrlSpaceDefaultMappingKey = "<space>W"
"packadd vim-ctrlspace
packadd vim-dispatch
packadd vim-tbone

nmap m% m<space>%<CR>
nmap <space>fm <space>fsm<space>%<CR>
nmap m* m<space><C-R><C-A><C-H><CR>
let g:dispatch_pane = "+"
nnoremap <space>rr :call TmuxSend(":r\n")<CR>
nnoremap <space>rb :call TmuxSend(":l " . expand("%:p")."\n")<CR>
nnoremap <space>rc :call TmuxSend(":set +c\n:l " . expand("%:p")."\n")<CR>
nnoremap <space>rt :call TmuxSend(":t " . expand("<cword>")."\n")<CR>
nmap <space>rT viw<space>rtv
nmap <space>rU viw<space>ruv
nmap <space>rL viw<space>rlv
nnoremap <space>ri :call TmuxSend(":i " . expand("<cword>")."\n")<CR>
nnoremap <space>rs :AbortDispatch<CR>
nnoremap <space>ro :Copen<CR>:cc<CR>
nnoremap <space>rq :Copen<CR>:cc<CR>:cclose<CR>
"nnoremap <space>rO execute "Copen \| call ClearTmuxLog()"<CR>:cc<CR>
nnoremap <space>rO :Copen<CR>:call ClearTmuxLog()<CR>:cc<CR>
nnoremap <space>rQ :Copen<CR>:call ClearTmuxLog()<CR>:cc<CR>:cclose<CR>

" split dispatch tmux-panel and link it to session 2-
nnoremap <space>r! :call TmuxSendBreak()<CR>
nnoremap <space>rC :call TmuxSend('C-c')<CR>
nnoremap <space>ra :call TmuxSend("appMain\n")<CR>
nnoremap <space>r<Up> :call TmuxSend('up') \| call TmuxSend("\n")<CR>
nnoremap <space>r<Cr> :call TmuxSend('up') \| call TmuxSend("\n")<CR>
augroup auto_quickfick
  au!
  au BufWritePre *.elm call ClearTmuxLog()
augroup END

function TmuxSend(command, refresh=1)
  if a:refresh
    call ClearTmuxLog()
  endif
  call tbone#send_keys(g:dispatch_pane, a:command)
  " we can't get the result because the call is asynchronous
  " therefore we don't know when it finished
  " if 0 " a:refresh
  "   Copen
  "   cwindow
  " endif
endfunction

function TmuxSendBreak()
  let g:dispatch_pane="2-"
  Tmux break-pane -s.+
  Tmux link-window -t2-
  Tmux select-window -t!
endfunction

function ClearTmuxLog()
  call writefile(["Cleared"], &errorfile)
endfunction

" search word within function
function! SearchInBlock(regex='') 
  let end = search('^\S', 'Ws')
  let start = search('^\S', 'bW')
  return '\%>' . (start-1) . 'l\%<' . end . 'l' . a:regex
endfunction

" word within block
nnoremap <space>Sv /<C-R>=SearchInBlock('\C\<<C-R><C-W>\>')<CR><CR>
" start search within block
nnoremap <space>sv /<C-R>=SearchInBlock()<CR>

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
  call TmuxSend(l:command)
endfunction

" asy motion
imap <C-F> <esc>:<C-u>call EasyYank()<CR>
"
vmap <CR> ygi<C-R>0
function! EasyYank()
  "call EasyMotion#S(2,0,2)
  call EasyMotion#OverwinF(2)
  execute "normal ve"
endfunction


"let g:context_highlight_normal = 'yellow'
" let g:context_highlight_normal = 'PMenu'
packadd context.vim



"cnoremap .. .*

" Macro
"nnoremap <space>xx :execute ":normal ".getline('.')<CR>k
"nnoremap <space>x: :execute getline('.')<CR>k




function MyIndent(line)
  let indent = indent(a:line)
  if indent < 0
    return [indent,indent]
  endif

  let line = substitute(getline(a:line), '^-\+\s', '', '')
  let headings = match(line, '^[*#]\+\zs\s')+1
  if headings <= 0
    let headings = 5
  endif

  return [indent+headings,indent]
endfunction

let g:Context_indent= function("MyIndent")
let g:context_skip_regex = '^\s*$'
nnoremap <space>tC :ContextToggle<CR>


function! QuicklistToSearch(extra="")
  return QFlistToSearch(getqflist(), a:extra)
endfunction
function! LoclistToSearch(extra="")
  return QFlistToSearch(getloclist(), a:extra)
endfunction
function! QFlistToSearch(list, extra="")
  let buf = bufnr()
  let loc = filter(a:list, {idx, qf -> qf.bufnr == buf})
  let regexps = map(loc, { idx, qf -> '\%(' . QFToRegex(qf) . a:extra . '\)'})
  return join(regexps, '\|')
endfunction

function QFToRegex(qf)
  let regex = ''
  if has_key(a:qf, 'lnum')
    let regex .= '\%' . a:qf.lnum . 'l'
  endif
  if has_key(a:qf, 'col')
    let regex .= '\%' . a:qf.col . 'c'
  endif
  return regex
endfunction

nnoremap <space>cS /<C-R>=QuicklistToSearch()<CR>
nnoremap <space>cs /<C-R>=QuicklistToSearch('\w\+')<CR><CR>
nnoremap <space>lS /<C-R>=LoclistToSearch()<CR>
nnoremap <space>ls /<C-R>=LocQuicklistToSearch('\<\w\+\>')<CR><CR>



" Abbrec
cabbrev ehco  echo
cabbrev ecoh  echo
iabbrev subtititue substitute
iabbrev subsitute  substitute


" XRange
let g:xrange_macros = {'prod':    {'x' : '!mysql -h127.0.0.1 -uroot -pprod -P3016 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'stag':    {'x' : '!mysql -h127.0.0.1 -uroot -pstag -P3308 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'hot':    {'x' : '!mysql -h127.0.0.1 -uroot -phot-prod -P4016 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'dc2':    {'x' : '!mysql -h127.0.0.1 -uroot -pdc-dev -P5016 commerce < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'sql':    {'x' : '!mysql -h'.$DB_HOST.' -u'.$DB_USER.' -p'.$DB_PASSWORD.' -P'.$DB_PORT.' '.$DB_NAME.' < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'psql':    {'x' : '!psql sese-website < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \}

" Wiki
" let g:vimwiki_list = [{'path': '~/devel/DC2/vimwiki', 'auto_export': 1 }]
" let g:vimwki_valid_html_tags = ['h2']
" packadd vimwiki

autocmd Filetype vimwiki let b:xrange_start='%%%% :%s:' |  let b:xrange_end='%%%% .%s.'
      \ | let b:xrange_macros = { 'comment':  {'aw': 's/^%%  //', 'ar' : 's/^/%%  '}}

" let g:gitgutter_diff_relative_to= 'working_tree'
"
"
"




function GotoTopContext()
  let base_line = context#line#get_base_line(w:context.top_line)
  let lines = context#context#get(base_line)
  if empty(lines)
    let goto = line('w0')
  else
    let goto = lines[0].number
  endif
  execute goto

  return lines
endfunction

nnoremap 0H :call GotoTopContext()<CR>
"
"
" indent
packadd vim-indentwise
nmap [0 0[_
nmap ]0 0]_

let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['#00588f', '#a7111d', '#336f15', '#e44c22']} ", '#72654f']}
packadd rainbow
" let g:rainbow_conf = {'guifgs': ['blue', 'red', 'green', 'magenta','darkyellow', 'orange']}
" from yui
" unbalanced parenthesis - highlight parenthesis not picked up by rainbow
hi OpenParenthesis guibg=red guifg=yellow
au Syntax * syn match OpenParenthesis "[])}]"

" Indention
" insert space where the selection is
vnoremap ><space> ^yPgvr<space>^
vnoremap <tab> yPgvr<space>^
nmap <space>i% <c-v>]%<tab>
nmap <space>>> hv^<tab>

" break
nmap <space><Cr> c$<Cr><C-R>0<Esc>k$j<space>>>


" comment  {- surround -} 
let g:surround_99 ="{- \r -}"

"togge
nnoremap <silent> <space>to :setlocal cursorcolumn!<CR>
nnoremap <silent> <space>tO :setlocal cursorline!<CR>
nnoremap <silent> <space>tw :setlocal wrap!<CR>
nnoremap <silent> <space>tW :setlocal wrapscan!<CR>
nnoremap <silent> <space>tl :setlocal list!<CR>
nnoremap <silent> <space>tr :setlocal relativenumber!<CR>
nnoremap <silent> <space>tn :setlocal number!<CR>
nnoremap <silent> <space>ts :setlocal spell!<CR>
nnoremap <silent> <space>ti :setlocal ignorecase!<CR>
nnoremap <silent> <space>tg :setlocal gdefault!<CR>
nnoremap <silent> <space>tfS :setlocal foldopen-=search<CR>
nnoremap <silent> <space>tfs :setlocal foldopen+=search<CR>


inoremap ;; <C-R>"
cnoremap ;; <C-R>"


autocmd FileType vader packadd vader.vim

" search within screen
nnoremap g/ /\%><C-R>=line('w0')-1<CR>l\%<<C-R>=line('w$')+1<CR>l
nnoremap g? ?\%><C-R>=line('w0')-1<CR>l\%<<C-R>=line('w$')+1<CR>l


" quickscope
packadd quick-scope
hi QuickScopePrimary guifg=red cterm=underline
hi QuickScopeSecondary guifg=blue cterm=underline
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
"
"
"
" auto marks
autocmd FileType elm 1;/^import/mark i
autocmd FileType haskell 1;/^import/mark i


" ingo/jump
let mapleader = '\'


" try for easy commands swap , and :
nnoremap , :
nnoremap <space>. .
"let g:clever_f_mark_direct = 1
"packadd clever-f.vim


