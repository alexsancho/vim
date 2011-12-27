" This file contains settings for how the vim display is handled.
" This is *not* where gui-mode specific settings are held. That's in gui.vim.
" These settings apply to both gui mode and console mode vim.

set laststatus=2                                                                " always display a status line
set number                                                                      " show line numbers
set ruler                                                                       " display coordinates in status bar

set rulerformat=%40(%4l,%2v(%p%%\ of\ \%L)%<%=%8.20t%m%R%)

set showcmd                                                                     " display unfinished commands
set showmatch                                                                   " show matching bracket (briefly jump)
set showmode                                                                    " display the current mode in the status bar
set title                                                                       " show file in titlebar
set gcr=a:blinkon0                                                              " Disable cursor blink

set foldmethod=indent                                                           " fold based on indent
set foldnestmax=3                                                               " deepest fold is 3 levels
set nofoldenable                                                                " dont fold by default

set scrolloff=8                                                                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" status bar
set statusline=%#DiffAdd#
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%#DiffAdd#
set statusline+=%h%m%r%w                                                        " status flags
set statusline+=\ %<%f\  
set statusline+=%#LineNr#                                                       " switch to colors used for line number
set statusline+=\ [%{&ff}/%Y]                                                   " filetype

set statusline+=\ %{rvmprompt#statusline()}
set statusline+=\ %{fugitive#statusline()}
set statusline+=%#DiffAdd#                                                      " switch back to normal

set statusline+=%=                                                              " left/right separator

"display a warning if &paste is set
set statusline+=%#DiffChange#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%#LineNr#                                                       " switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \                              " current highlight
set statusline+=%#DiffAdd#                                                      " switch to colors used for line number
set statusline+=%c:                                                             " cursor column
set statusline+=%l/%L                                                           " cursor line/total lines
set statusline+=\ %P                                                            " percent through file

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
