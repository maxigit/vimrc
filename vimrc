" Basic {{{
set hidden
set exrc
set secure
" Set viminfo per project
" set viminfo='5,<1000,h
" use the first .viminfo file find upward
" to copy the parent one to the local di
" :wv .viminfo
let &viminfofile=findfile('.viminfo','.;')
" Undo
set undofile
set undodir=$HOME/.vim/undo
set history=1000
" Tab
set expandtab
set tabstop=2
set shiftwidth=2

set clipboard=unnamedplus
set incsearch
set hls
set ai
" wrapping
set breakindent " indent wrapped line
set linebreak " break wrapped line between word
set showbreak=\ \ ∥\ 

let g:mapleader=" "
set ruler
set laststatus=0
set rulerformat=%17(%c%V,%l\ %#WarningMsg#%m%#Normal#%=%p%%%)

set cursorline
set virtualedit=all
syntax on
filetype plugin indent on
set foldtext=printf('%-50s',getline(v:foldstart)).'\ <'.repeat('=',(v:foldend-v:foldstart-1)).'>\ '
nnoremap , :
nnoremap :: ,
inoremap <C-R>' <C-R>"
inoremap <C-R><space> <C-R>0


" cheap surround 
nnoremap cs "_c
nnoremap ds "_d

nmap m% m<space>%<CR>
nmap m* m<space><C-R><C-A><C-H><CR>
let g:dispatch_pane = "+"

" Current window in a new tab
nnoremap <C-W><C-T> <C-W>s<C-w>T

" insert undo point for new line
inoremap <Cr> <C-g>u<Cr>
nnoremap v <C-v>
" Themes {{{
" let &background = strftime('%H') >= 18 ? "dark" : "light"
autocmd ColorScheme lunaperche hi MatchParen term=NONE cterm=NONE | hi link Identifier Type | hi SignColumn cterm=standout | hi FoldColumn cterm=standout 
colorscheme lunaperche
 
" abbrev
cabbrev azz abcdeghijklmnopqrstuvwxyz
cabbrev aZZ abcdeghijklmnopqrstuvwxyzABCDEGHIJKLMNOPQRSTUVWXYZ
cabbrev Azz ABCDEGHIJKLMNOPQRSTUVWXYZ

cabbrev ecoh echo

" Mapping {{{
nnoremap <space>: :Commands<CR>
nnoremap <space>/ :Rg! <CR>
nnoremap <space>* :Rg! <C-R><C-W><CR>
" ranger
let g:ranger_map_keys = 0
nnoremap <space>ar :Ranger<CR>
nnoremap <space>ad :RangerWorkingDirectory<CR>
" FZF
nnoremap <space>ff :Files<CR>
nnoremap <space>fF :FZF ~<CR>
nnoremap <space>fv :call fzf#run(fzf#wrap({'source':'find ~/.vim'}))<CR>
nnoremap <space>fg :GFiles!<CR>
nnoremap <space>b :Buffers<CR>
" nnoremap <space>b :b<space><C-d>
nnoremap <space>fc :Colors!<CR>
nnoremap <space>ft :Tags<CR>
nnoremap <space>fT :Tags <C-R><C-W><CR>
nnoremap <space>fh :Helptags!<CR>
nnoremap <space>fr :History<CR>
nnoremap <space>f: :Commands<CR>
nnoremap <space>; :History:<CR>
nnoremap <space>fW :Windows<CR>
nnoremap <space>f/ :History/<CR>
nnoremap <space>f' :Marks<CR>
nnoremap <space>fq :Quickfick<CR>
nnoremap <space>fl :Quickfick!<CR>
"nnoremap <space>f<space> :Maps<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <space>fy :Filetypes<CR>
"tig
let g:tig_explorer_use_builtin_term=0
nnoremap <silent> <space>gs :Tig status<CR>
nnoremap <silent> <space>gb :TigBlame<CR>
nnoremap <silent> <space>gf :TigOpenCurrentFile<CR>
nnoremap <silent> <space>gd :TigOpenFileWithCommit!<CR>
nnoremap <silent> <space>gc :Commits
nnoremap <silent> <space>gS :GFiles?!
nnoremap <silent> <space>gB :BCommits
" Tmux Haskell
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
nnoremap <space>rq :Copen<CR>:cc<CR>:lclose<CR>
"nnoremap <space>rO execute "Copen \| call ClearTmuxLog()"<CR>:cc<CR>
nnoremap <space>rO :Copen<CR>:call ClearTmuxLog()<CR>:cc<CR>
nnoremap <space>rQ :Copen<CR>:call ClearTmuxLog()<CR>:cc<CR>:lclose<CR>

" split dispatch tmux-panel and link it to session 2-
nnoremap <space>r! :call TmuxSendBreak()<CR>
nnoremap <space>rC :call TmuxSend('C-c')<CR>
nnoremap <space>ra :call TmuxSend("appMain\n")<CR>
nnoremap <space>rm :call TmuxSend("main\n")<CR>
nnoremap <space>r<Up> :call TmuxSend('up') \| call TmuxSend("\n")<CR>
nnoremap <space>r<Cr> :call TmuxSend('up') \| call TmuxSend("\n")<CR>
"synchronize tmux pane with break
nnoremap <space>r0 :Tmux select-window -t'2-:*0-'<CR>
nnoremap <space>r1 :Tmux select-window -t'2-:*1-'<CR>
nnoremap <space>r2 :Tmux select-window -t'2-:*2-'<CR>
nnoremap <space>r3 :Tmux select-window -t'2-:*3-'<CR>
nnoremap <space>r6 :Tmux select-window -t'2-:*6-'<CR>
nnoremap <space>rR :!tmux run-shell "tmux select-window -t2-:*\#{session_name}"<CR>
" Search
nnoremap <space>sc :noh<CR>
nnoremap <space>ss :BLine<CR>
nnoremap <space>sS :BLine <C-R><C-W><CR>
nnoremap <space>Ss :Line<CR>
nnoremap <space>SS :Line <C-R><C-W><CR>
nnoremap <space>sq :g/\<<C-R><C-W>\>/laddexpr expand("%") . ":" . line(".") . ":" .  getline(".")<CR>:lopen<CR>
nnoremap <space>sQ :g//laddexpr expand("%") . ":" . line(".") . ":" .  getline(".")<CR>:lopen<CR>
" word within block
nnoremap <space>Sv /<C-R>=SearchInBlock('\C\<<C-R><C-W>\>')<CR><CR>
" start search within block
nnoremap <space>sv /<C-R>=SearchInBlock()<CR>
" Toggling t
nnoremap <silent><leader>tb :if &bg=="light" \| set bg=dark \| else \| set bg=light \| endif<CR>
nnoremap <silent><leader>ti :<C-U>set ignorecase!
nnoremap <silent><leader>tn :<C-U>set number!<CR>
nnoremap <silent><leader>tr :<C-U>set relativenumber!<CR>
" nnoremap <silent><leader>ts :<C-U>set smartcase!
" nnoremap <silent><leader>tw :<C-U>set wrap!


" Square brackets, sames as surrond
onoremap ar a[
onoremap ir i[


" Plugin Settings {{{1
" DB profile {{{2
let g:dbext_default_profile_prod = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=3016'
let g:dbext_default_profile_warehouse = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=warehouse:port=3016'
let g:dbext_default_profile_stag = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=3308'
let g:dbext_default_profile_hot = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=fa:port=4016'
let g:dbext_default_profile_dc = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=commerce:port=3006'
let g:dbext_default_profile_dc2 = 'type=mysql:host=127.0.0.1:user=root:passwd=dc-dev:dbname=commerce:port=5016'
let g:dbext_default_profile_dcprod = 'type=mysql:host=dec.shop.mae.uk0.bigv.io:user=warrior:passwd=@askg:dbname=commerce:port=3306'
let g:dbext_default_profile_prod_all = 'type=mysql:host=127.0.0.1:user=root:passwd=@askg:dbname=@askg:port=3016'
let g:dbext_default_profile_psql = 'type=PGSQL::user=max:dbname=sese-website'

" XRange
let g:xrange_macros = {'prod':    {'x' : '!mysql -h127.0.0.1 -uroot -pprod -P3016 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'stag':    {'x' : '!mysql -h127.0.0.1 -uroot -pstag -P3308 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'stag2':    {'x' : '!mysql -h127.0.0.1 -uroot -pstag2 -P3307 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'hot':    {'x' : '!mysql -h127.0.0.1 -uroot -phot-prod -P4016 fa < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'dc2':    {'x' : '!mysql -h127.0.0.1 -uroot -pdc-dev -P5016 commerce < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'dcprod':    {'x' : '!mysql -hdec.shop.mae.uk0.bigv.io -u'.$DC_PROD_USER.' -p'.$DC_PROD_PASSWORD.' -P3306 commerce < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'sql':    {'x' : '!mysql -h'.$DB_HOST.' -u'.$DB_USER.' -p'.$DB_PASSWORD.' -P'.$DB_PORT.' '.$DB_NAME.' < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'psql':    {'x' : '!psql sese-website < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \,'pstag':    {'x' : '!psql $STAG_PSQL < @< > @:out+> 2> @:error@ ', 'syntax' : 'sql' }
      \}

" xrange-2
packadd vim-xrange2
let g:xblock_commands = {}
let g:xblock_commands['stag'] = "
      \  &mysql
      \ @in.pre:[::range:s/&gt;/>/ge | ::range:s/&lt;/</ge | ::range:s/&#039;/'/ge]
      \  MYSQL_USER=$MYSQL_STAG_USER MYSQL_PASSWORD=$MYSQL_STAG_PASSWORD
      \  MYSQL_HOST=$MYSQL_STAG_HOST MYSQL_PORT=$MYSQL_STAG_PORT
      \  MYSQL_DB=$MYSQL_STAG_DB"
"
for db in ['prod', 'hot', 'dc', 'llb', 'stag2']
  let g:xblock_commands[db] = substitute(g:xblock_commands['stag'], 'STAG', printf('\U%s', db), 'g')
endfor

let g:xblock_commands['sese'] = "
    \ &psql
    \ @in.pre:[::range:s/&gt;/>/ge | ::range:s/&lt;/</ge | ::range:s/&#039;/'/ge]
    \ PSQL_DB=sese-website
    \"
let g:xblock_commands['pstag'] = substitute(g:xblock_commands['sese'], 'sese-website', '$STAG_PSQL', 'g')

" Function {{{
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
  Tmux rename-window '*#{session_name}'
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


function Two()
  let s = ":"
  echo s
  let c1 = getcharstr()
  if c1 == '.'
    return c1
  endif
  let s .= c1
  echo s
  let c2 = getcharstr()
  let s .= c2
  if c2 != ""
    let s .= ""
  endif
  echo s
  return s
endfunction

nnoremap <expr> . Two()
nnoremap <expr> - Two()
	
nnoremap :cN :cnf<Cr>
nnoremap :cP :cpf<Cr>
nnoremap :nh :noh<Cr>


" search visual
nnoremap g/ /\%><C-R>=line('w0')-1<CR>l\%<<C-R>=line('w$')+1<CR>l
nnoremap g# ?\%><C-R>=line('w0')-1<CR>l\%<<C-R>=line('w$')+1<CR>l
let g:sneak#label = 1
let g:sneak#s_next = 1
packadd! vim-sneak
