" Use wildcard menus for completion
set wildmenu

" Use bash-like tab completion
set wildmode=longest,list

set wildignore+=node_modules,classes,target,Maildir,tmp
set wildignore+=*.pyc,*.o,*.a,*.class,*.jar,*.zip,*.tgz,*.tar.gz,*.tbz2,*~

set wildignore+=.git,.hg,.svn,.bzr,CVS