if has("autocmd")
	" Make sure all mardown files have the correct filetype set and setup wrapping
	 au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

	 " Treat JSON files like JavaScript
	 au BufNewFile,BufRead *.json set ft=javascript

	augroup invisible_chars
        au!

        " Show invisible characters in all of these files
        autocmd filetype vim setlocal list
        autocmd filetype ruby setlocal list
        autocmd filetype javascript,css setlocal list
    augroup end

	augroup ruby_files
        au!

        autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    augroup end

	augroup css_files
	     au!

	     autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
	augroup end

	augroup javascript_files
	     au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal listchars=trail:·,extends:#,nbsp:·
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}
    augroup end
endif
