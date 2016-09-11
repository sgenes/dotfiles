" ============================= "
" ViM keymap                    "
" Author: Tamado Ramot Sitohang "
" License: MIT                  "
" ============================= "

let mapleader=","

nnoremap ;                            :
nnoremap <silent><F3>                 :noh<CR><Esc>
inoremap <expr><C-g>                  neocomplete#undo_completion()
inoremap <expr><C-k>                  neocomplete#complete_common_string()
nnoremap <silent><F4>                 :set invpaste paste?<CR>
nnoremap <silent><C-a>                :GundoToggle<CR>
inoremap <silent><C-a>                <C-o>:GundoToggle<CR>
map <silent><C-e>                     :NERDTreeToggle<CR>
map <silent><F2>                     :ene<CR>
nmap <silent>q                        :conf q<CR>
nmap                                <nop>
imap <silent>                       <C-o>:conf q<CR>
nmap <silent>                       :w!<CR>
inoremap <silent><c-s>                <C-o>:update<CR>
nmap e                                <C-R>
imap <silent>                       <C-o>u
imap <silent>                       <C-o><C-R>
imap <C-l>                            <Esc><Esc>
vmap <C-l>                            <Esc><Esc>
nmap .                                <C-]>
nmap \                                <C-o>
nmap <silent>                       ,ci
vmap <silent>                       ,ci
imap <silent>                       <C-o>,ci
nmap                                %
nnoremap <silent>-                    <C-w>-
nnoremap <silent>+                    <C-w>+
nnoremap <silent>=                    <C-w>=
map <C-S-Down>                        <C-w><C-w>
map <C-S-Up>                          <C-w>w
nmap <silent>                       :bp<CR>
nmap <silent><Space>                  :bnext<CR>
nmap <silent><Del>                    :bdelete!<CR>
" inoremap <expr><TAB>                  pumvisible() ? "\<C-n><C-y>" : "\<C-R>=neosnippet#mappings#expand_or_jump_impl()"
" inoremap <expr><C-h>                  neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>                   pumvisible() ? "\<C-h>=neocomplete#smart_close_popup()" : "<Plug>delimitMateBS"
nnoremap <silent><Leader><Leader>     :noh<CR>
imap <C-k>                            <Plug>(neosnippet_expand_or_jump)
smap <C-k>                            <Plug>(neosnippet_expand_or_jump)
xmap <C-k>                            <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-y>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
