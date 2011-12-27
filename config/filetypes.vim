augroup filetypedetect
	" Markdown
	au BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>

	" JSON
	au BufRead,BufNewFile *.json set ft=json syntax=javascript

	" Common Ruby files
	au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

	" Coffee Folding
	au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

	" plaintext type
	au BufRead,BufNewFile *.txt setf text

	" rst type
	au BufRead,BufNewFile TODO,README,*.cal setf rst

	" configuration file
	au BufRead,BufNewFile *.conf setf cfg
augroup END