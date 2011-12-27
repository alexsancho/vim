" set up automatic ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" taglist & ctags
map <silent> <Leader>tl :TlistToggle<CR>

let Tlist_Use_Right_Window = 1
let tlist_xml_settings = 'xml;i:id'
let tlist_xhtml_settings = tlist_xml_settings
let tlist_html_settings = tlist_xml_settings
let tlist_htmldjango_settings = tlist_xml_settings
let tlist_markdown_settings = 'markdown;h:Headings'
let tlist_css_settings = 'css;s:Selectors'
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'