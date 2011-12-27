Notes
=====
In general, a couple of rules are used:

* All custom keybindings start with `<Leader>`.
* `<Leader>x` is used as an 'extension' to provide more options for bindings.
* In some cases, multiple bindings are used for a single letter (e.g. `<Leader>q` and `<Leader>Q`). In those cases, the capitalized version is always used for commands that have more side-effects (e.g. `<Leader>q` closes one window, `<Leader>Q` closes all windows).

General
=======
`;` - The Leader key. Used in any binding where "`<Leader>`" is present.  
    e.g. in Command-T below, where `<Leader>t` is listed, that is (by default) a mapping for "`;t`". The Leader key can be changed in `~/.vimrc`.

`<Leader>ss` - start spelling on buffer.  

`<Leader>q` - quit the current window.  
`<Leader>Q` - quit all windows (exit this vim session)

`<Leader>w` - write the current buffer (save).  
`<Leader>W` - write the current buffer and quit the current window.

`<Leader>h` - move to the window to the left of the current window.  
`<Leader>j` - move to the window below the current window.  
`<Leader>k` - move to the window above the current window.  
`<Leader>l` - move to the window to the right of the current window.

Ack.vim
=======
`<Leader>a` - Prompt you for a string to :Ack!  

Ctrlp.vim
=========
`<Leader>b` - display the buffers list  

Fugitive
========
`<Leader>gs`  - Display git status.  
`<Leader>gb`  - Display git blame.  
`<Leader>gl`  - Display git log.  
`<Leader>gd`  - Display git diff.  
`<Leader>gnc` - Git svn dcommit.  
`<Leader>gnr` - Git svn rebase.

Gundo.vim
=========
`<Leader>u` - Toggle Gundo  

NERDTree
========
`<Leader>d` - Toggle NERDTree  

Prefixr.vim
===========
`<Leader>p` - Run :Prefixr on the selection  

Rails.vim
=========
`<Leader>rc` - runs script/console  
`<Leader>rg` - runs script/generate  
`<Leader>rs` - runs script/server (or restarts it as necessary)  

`<Leader>ri` - runs the migration inversion command  

`<Leader>ra` - open an "alternate" file  
`<Leader>rr` - open a "related" file  

Surround.vim
============
`cs'"`        - e.g. replace surrounding single-quotes (') with double-quotes (").  
`ds"`         - e.g. remove the surrounding double-quotes (").  
`ys[motion]"` - e.g. surround the text identified by [motion] with double-quotes ("). [^motionhelp]

Snipmate.vim
============
`<Leader>s` - expands snippets that start by current word

Tagbar.vim
===========
`<Leader>t` - Toggle Tagbar  

Tasklist.vim
===========
`<Leader>tl` - Scan for Tasks  

W3Cvalidate.vim
===============
`<Leader>v` - to validate the current buffer  

[^motionhelp]: use :help text-objects for more information about available motions.
