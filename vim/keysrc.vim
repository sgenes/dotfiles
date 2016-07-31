" ============================= "
" ViM keymap                    "
" Author: Tamado Ramot Sitohang "
" License: MIT                  "
" ============================= "

let mapleader=","

inoremap <expr><C-g>            neocomplete#undo_completion()
inoremap <expr><C-k>            neocomplete#complete_common_string()

nnoremap <silent><C-a>          :GundoToggle<CR>
map <silent><C-e>               :NERDTreeToggle<CR>
map <silent><C-n>               :tabnew<CR>
nmap <silent><TAB>              :tabnext<CR>
nmap <silent><S-TAB>            :tabprev<CR>
nmap <silent>q                  :conf q<CR>
nmap                          <nop>
imap <silent>                 <C-o>:conf q<CR>
nmap <silent>                 :w!<CR>
inoremap <silent><c-s>          <C-o>:update<CR>
nmap e                          <C-R>
imap <silent>                 <C-o>u
nmap <silent>x                <C-R>
imap <silent>x                <C-o><C-R>
imap <C-l>                      <Esc><Esc>
vmap <C-l>                      <Esc><Esc>
nmap .                          <C-]>
nmap \                          <C-o>
nmap <silent>                 ,ci
vmap <silent>                 ,ci
imap <silent>                 <C-o>,ci
nmap                          %
nnoremap <silent>-              <C-w>-
nnoremap <silent>+              <C-w>+
nnoremap <silent>=              <C-w>=
map <C-S-Down>                  <C-w><C-w>
map <C-S-Up>                    <C-w>w
nmap <silent>                 :bp<CR>
nmap <silent><Space>            :bnext<CR>
nmap <silent><Del>              :bdelete<CR>
nmap <silent><C-Del>            :tabclose<CR>
inoremap <expr><TAB>            pumvisible() ? "\<C-n><C-y>" : "\<C-R>=UltiSnips#ExpandSnippet()"
inoremap <expr><C-h>            neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>             neocomplete#smart_close_popup()."\<C-h>"
