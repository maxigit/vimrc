syntax include @SQl /usr/share/vim/vim90/syntax/sql.vim
syntax region includeSql start=/\c^\n\(select\|insert\|update\)/ end=/\ze\n.*!!!'/  contains=@SQL


