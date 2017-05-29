" ============================= "
" ViM keymap                    "
" Author: Tamado Ramot Sitohang "
" License: MIT                  "
" ============================= "

let g:mapleader=','

nnoremap ;                            :
nnoremap <silent><F3>                 :noh<CR><Esc>
" inoremap <expr><C-g>                  neocomplete#undo_completion()
" inoremap <expr><C-k>                  neocomplete#complete_common_string()
nnoremap <silent><F4>                 :set invpaste paste?<CR>
nnoremap <silent><F5>                 :GundoToggle<CR>
inoremap <silent><F5>                 <C-o>:GundoToggle<CR>
map <silent><C-o>                     :NERDTreeToggle<CR>
map <silent><F2>                      :ene<CR>
nmap <silent>q                        :conf q<CR>
nmap <C-q>                            <nop>
imap <silent><C-q>                    <C-o>:conf q<CR>
nmap <silent><C-s>                    :w!<CR>
inoremap <silent><C-s>                <C-o>:update<CR>
imap <silent><C-Z>                    <C-o>u
imap <silent><C-R>                    <C-o><C-R>
imap <C-l>                            <Esc><Esc>
vmap <C-l>                            <Esc><Esc>
nmap <BS>                             <C-t>
nmap <silent>                       ,ci
vmap <silent>                       ,ci
imap <silent>                       <C-o>,ci
nmap <C-M>                            %
nnoremap <silent>-                    <C-w>-
nnoremap <silent>+                    <C-w>+
nnoremap <silent>=                    <C-w>=
map <C-S-Down>                        <C-w><C-w>
map <C-S-Up>                          <C-w>w
nmap <Tab>                            <C-w><C-w>
nmap <S-Tab>                          <C-w>w
nmap <silent><C-\>                    :bp<CR>
nmap <silent><Space>                  :bnext<CR>
nmap <silent><Del>                    :conf bdelete<CR>
" inoremap <expr><TAB>                  pumvisible() ? "\<C-n><C-y>" : "\<C-R>=neosnippet#mappings#expand_or_jump_impl()"
" inoremap <expr><C-h>                  neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>                   pumvisible() ? "\<C-h>=neocomplete#smart_close_popup()" : "<Plug>delimitMateBS"
nnoremap <silent><Leader><Leader>     :noh<CR>
" imap <C-k>                            <Plug>(neosnippet_expand_or_jump)
" smap <C-k>                            <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>                            <Plug>(neosnippet_expand_target)
nnoremap <silent><F6>                 :TagbarToggle<CR>

" SuperTab like snippets behavior.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-y>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
