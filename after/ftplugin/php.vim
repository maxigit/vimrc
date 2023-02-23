setlocal includeexpr=substitute(v:fname,'^/','','')
setlocal include=\\(require\\\|include\\)\\(_once\\)\\?(\\(\\$path_to_root\\s*\\.\\s*\\)\\?\"\\zs.*\\ze\");
setlocal suffixesadd=.php,.inc

setlocal define=function
