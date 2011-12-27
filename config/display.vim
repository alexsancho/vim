" This file contains settings for how the vim display is handled.
" This is *not* where gui-mode specific settings are held. That's in gui.vim.
" These settings apply to both gui mode and console mode vim.

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
set statusline=                                                                 " clear the statusline for when vimrc is reloaded
set statusline+=%#warningmsg#

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{StatuslineTabWarning()}                                       "display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{&ff!='unix'?'['.&ff.']':''}                                   "display a warning if fileformat isnt unix
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}                 "display a warning if file encoding isnt utf-8
set statusline+=%{&paste?'[paste]':''}                                          "display a warning if &paste is set

set statusline+=%#DiffAdd#
set statusline+=%h%m%r%w                                                        " status flags
set statusline+=\ %<%f
set statusline+=%#LineNr#                                                       " switch to colors used for line number
set statusline+=\ %y                                                            " filetype

set statusline+=\ %{rvmprompt#statusline()}
set statusline+=\ %{fugitive#statusline()}

set statusline+=%=                                                              " left/right separator

set statusline+=%#DiffAdd#                                                      " switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \                              " current highlight
set statusline+=%#LineNr#                                                       " switch to colors used for line number
set statusline+=%c:                                                             " cursor column
set statusline+=%l/%L                                                           " cursor line/total lines
set statusline+=\ %P                                                            " percent through file

set laststatus=2                                                                " always display a status line

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction
