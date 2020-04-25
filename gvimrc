set guioptions=Aei
set lines=30
set columns=132
set guifont=Iosevka\ Fixed\ SS07\ Semibold\ 11
set stal=2
set guicursor=n-v-c:ver25-Cursor/lCursor
set guicursor+=o:ver25-Cursor/lCursor
set guicursor+=sm:block-Cursor
set guicursor+=r-cr:hor20-Cursor/lCursor
" hi clear SpellBad
" hi clear SpellCap
hi SpellBad guibg=NONE
hi SpellCap guibg=NONE
let g:coc_start_at_startup = 0
autocmd BufRead *.scala,*.sbt :CocStart
nmap <C-K>f :NERDTree %<CR>cd
" vim:fdm=marker
