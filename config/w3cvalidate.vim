""" Keybindings
"""""""""""""""

" Use <Leader>v to validate current buffer
map <Leader>v :W3cValidate<CR>


" The validator service url can be changed if you run an instance of it localy by setting g:w3_validator_url
" The script has API timeout default to 20 seconds. You can change it by setting g:w3_apicall_timeout