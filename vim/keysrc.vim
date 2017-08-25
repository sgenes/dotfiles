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
map <silent><F4>                      :set invpaste<CR>
nnoremap <silent><F5>                 :GundoToggle<CR>
inoremap <silent><F5>                 <C-o>:GundoToggle<CR>
map <silent><C-e>                     :NERDTreeToggle<CR>
map <C-o>                             :sp<space>
map <silent><F2>                      :ene<CR>
nmap <silent>q                        :conf q<CR>
nmap <C-q>                            <nop>
imap <silent><C-q>                    <C-o>:conf q<CR>
imap <silent><C-Z>                    <C-o>u
imap <silent><C-R>                    <C-o><C-R>
nnoremap <C-J>                        <C-W><C-J>
nnoremap <C-K>                        <C-W><C-K>
nnoremap <C-L>                        <C-W><C-L>
nnoremap <C-H>                        <C-W><C-H>
map <silent><Leader>g                         :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <BS>                             <C-t>
nmap <silent>                       ,ci
vmap <silent>                       ,ci
imap <silent>                       <C-o>,ci
nmap <C-M>                            %
nnoremap -                            <C-w>-
nnoremap +                            <C-w>+
nnoremap =                            <C-w>=
map <C-S-Down>                        <C-w><C-w>
map <C-S-Up>                          <C-w>w
nmap <silent><Tab>                    :bp!<CR>
nmap <silent><S-Tab>                  :bnext!<CR>
" nmap <silent><C-\>                    :bp<CR>
" nmap <silent><Space>                  :bnext<CR>
nmap <silent><Del>                    :conf bdelete<CR>
" inoremap <expr><TAB>                  pumvisible() ? "\<C-n><C-y>" : "\<C-R>=neosnippet#mappings#expand_or_jump_impl()"
" inoremap <expr><C-h>                  neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>                   pumvisible() ? "\<C-h>=neocomplete#smart_close_popup()" : "<Plug>delimitMateBS"
nnoremap <silent><Leader><Leader>     :noh<CR>
" imap <C-k>                            <Plug>(neosnippet_expand_or_jump)
" smap <C-k>                            <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>                            <Plug>(neosnippet_expand_target)
nnoremap <silent><F6>                 :TagbarToggle<CR>
nnoremap <space>                      za

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
