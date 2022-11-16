" Basic {{{
set hidden
set exrc
set secure
" Set viminfo per project
set viminfo='20,<1000,h
" use the first .viminfo file find upward
" to copy the parent one to the local di
" :wv .viminfo
" let &viminfofile=findfile('.viminfo','.;')
" Undo
set undofile
set undodir=$HOME/.vim/undo
set history=10000
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
set showbreak=∥\ \ \ 

let g:mapleader=" "
set ruler
set laststatus=0
set rulerformat=%120(
                 \\%#ErrorMsg#%{&smartcase?'SC':&ignorecase?'IC':''}%#Normal#
                 \\"«%#Folded#%-0.10{@\"[:9]}%#Normal#»
                 \\ -«%#Folded#%-0.10{@-[:9]}%#Normal#»%=
                 \\ 0«%#Folded#%-0.10{@0[:9]}%#Normal#»
                 \\ 1«%#Folded#%-0.10{@1[:9]}%#Normal#»
                 \\ +«%#Folded#%-0.5{@+[:4]}%#Normal#»
                 \\ *«%#Folded#%-0.5{@*[:4]}%#Normal#»
                 \\ /«%#Folded#%-0.5{@/[:4]}%#Normal#»
                 \%)%=\ %#Structure#%m%y%l,%c%V\ #%b\ %P

syntax on plugin indent

nnoremap , :
nnoremap :: ,
inoremap <C-R>' <C-R>"


" Themes {{{
let &background = strftime('%H') >= 18 ? "dark" : "light"
colorscheme lunaperche
autocmd ColorScheme lunaperche hi MatchParen term=NONE

" Mapping {{{
" Toggling t
nnoremap <silent><leader>tb :if &bg=="light" \| set bg=dark \| else \| set bg=light \| endif<CR>
nnoremap <silent><leader>ti :<C-U>set ignorecase!
nnoremap <silent><leader>tn :<C-U>set number!<CR>
nnoremap <silent><leader>tr :<C-U>set relativenumber!<CR>
" nnoremap <silent><leader>ts :<C-U>set smartcase!
" nnoremap <silent><leader>tw :<C-U>set wrap!


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
