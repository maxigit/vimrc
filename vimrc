" Basic {{{
set hidden
set exrc
set secure
" Set viminfo per project
" set viminfo='100,<1000,h
" use the first .viminfo file find upward
" to copy the parent one to the local di
" :wv .viminfo
" let &viminfofile=findfile('.viminfo','.;')
" Undo
set undofile
set undodir=$HOME/.vim/undo
set history=10000

let g:mapleader=" "

syntax on plugin indent

nnoremap , :
nnoremap :: ,


" Themes {{{
set bg=light
if strftime('%H') >= 18
	set bg=dark
endif
colorscheme lunaperche
autocmd ColorScheme lunaperche hi MatchParen term=NONE

" Mapping {{{
nnoremap <silent><leader>tb :if &bg=="light" \| set bg=dark \| else \| set bg=light \| endif<CR>
nnoremap <leader>tn :<C-U>set number!<CR>
nnoremap <leader>tr :<C-U>set relativenumber!<CR>


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
