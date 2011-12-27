""" Global settings for editing files

" Automatically indent lines, and try to do it intelligently
set autoindent
set smartindent

" backspace behaves 'normally' (goes across lines, etc.)
set backspace=indent,eol,start
" Same for left/right nav keys.
set whichwrap+=<,>,h,l

set listchars=tab:▸\ ,eol:¬,trail:☠

" Use spaces instead of tabs, and
" prefer 3 spaces.
set softtabstop=3
set tabstop=3
set shiftwidth=3
set expandtab

" Automatically reload a file if it's changed outside of vim (or in another
" window)
set autoread

" wrap lines rather than make use of the horizontal scrolling
set wrap
" try not to wrap in the middle of a word
set linebreak
" use an 80-character line limit
set textwidth=80

" set default local for spelling
setlocal spell spelllang=es
" set custom definitions file
set spellfile=~/.vim/spell/es-utf8.add
" spelling shortcut
map <silent> <leader>ss :setlocal spell!<CR>
set nospell

set encoding=utf-8
" for MacVim
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

" format settings
" t - Auto-wrap text using textwidth
" c - Auto-wrap comments using textwidth, inserting the current comment
" leader automatically.
" r - Automatically insert the current comment leader after hitting <Enter>
" in Insert mode.
" q - Allow formatting of comments with "gq".
" Note that formatting will not change blank lines or lines containing
" only the comment leader. A new paragraph starts after such a line,
" or when the comment leader changes.
" n - When formatting text, recognize numbered lists.
" 2 - When formatting text, use the indent of the second line of a paragraph
" for the rest of the paragraph, instead of the indent of the first line.
" 1 - Don't break a line after a one-letter word. It's broken before it
" instead (if possible).
set formatoptions=tcrqn21

" Automatically restore cursor position when possible
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \ exe "normal! g`\"" |
   \ endif

" ==========Ctrl+C/V/X from mswin.vim
" backspace in Visual mode deletes selectiobackspacen
vnoremap <BS> d

" CTRL-X - Cut
vnoremap <C-X> "+x

" CTRL-C - Copy
vnoremap <C-C> "+y

" CTRL-V - Paste
map <C-V>		"+gP
cmap <C-V>		<C-R>+

" Use CTRL-S - save
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-A - Select all
noremap <C-A> gggH<C-O>G

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
