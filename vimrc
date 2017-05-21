" ============================= "
" ViM configuration file        "
" Author: Tamado Ramot Sitohang "
" License: MIT                  "
" ============================= "

if &term ==# 'xterm-256color' || &term ==# 'screen-256color'

" vim-plug {{{
set nocompatible

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'eagletmt/neco-ghc'
" Plug 'flazz/vim-colorschemes'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neoinclude.vim'
" Plug 'roman/golden-ratio'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on' :  'NERDTreeToggle'  }
Plug 'scrooloose/syntastic', { 'for' : ['xml', 'r'] }
Plug 'w0rp/ale'
" Plug 'jordwalke/VimCompleteLikeAModernEditor'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'chrisbra/csv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'svermeulen/vim-easyclip'
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
" Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug '~/.vim/bundle/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'

call plug#end()
" }}}

" UI settings {{{
scriptencoding utf-8
syntax on
" set notitle
set virtualedit=onemore
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
" set t_Co=256
set termguicolors
set clipboard=unnamedplus
set background=dark
set number
set backspace=2
set switchbuf+=usetab,newtab
set grepprg=grep\ -nH\ $*
set cursorline
set ttimeoutlen=50
set smartcase
set hlsearch
set formatoptions=cql
set showmatch!
set updatetime=4000
set nowrap
" set wrapmargin=0
set nolinebreak
set autoread
set hidden
set shortmess+=c
" set noshowmode
let g:gitgutter_signs=0
let g:tex_conceal=''
let g:EasyClipEnableBlackHoleRedirect=0
colorscheme MoonMaster
let g:tagbar_show_visibility = 0
let g:tagbar_left = 1
let g:tagbar_width = 33
" }}}

" Airline settings {{{
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'MoonMaster'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#hunks#non_zero_only = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline_symbols.linenr = '☰  '
let g:airline_symbols.maxlinenr = ' '
" }}}

" Tmuxline Settings {{{
let g:tmuxline_separators = {
  \ 'left' : ' ',
  \ 'left_alt' : ' ',
  \ 'right' : ' ',
  \ 'right_alt' : ' ',
  \ 'space' : ' '}
" let g:tmuxline_preset = {
  " \'b'    : '#S',
  " \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
  " \'win'  : ['#I', '#W'],
  " \'cwin' : ['#I', '#W', '#F'],
  " \'x'    : '#(date)',
  " \'y'    : ['%R', '%a', '%Y'],
  " \'z'    : '#H'}
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'c'    : '#W [#F] - Window #I',
  \'x'    : ' #H ',
  \'z'    : [' %R %a %Y']}
" }}}

" ALE settings {{{
let g:ale_lint_on_save = 1
" }}}

" UltiSnips settings {{{
let g:UltiSnipsExpandTrigger = '<F10>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let b:snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return b:snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"
" }}}

" Completion settings {{{
" set tags+=~/.vim/tags/cpp
set completeopt-=preview
" set completeopt+=noinsert
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#enable_auto_close_preview = 1
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" if !exists('g:neocomplete#force_omni_input_patterns')
  " let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.c =
      " \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:neocomplete#force_omni_input_patterns.cpp =
      " \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:neocomplete#force_omni_input_patterns.objc =
      " \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
" let g:neocomplete#force_omni_input_patterns.objcpp =
      " \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
" let g:neocomplete#force_omni_input_patterns.ruby =
      " \ '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplete#force_omni_input_patterns.python =
      " \ '[^. *\t]\.\w*\|\h\w*\'
" \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neosnippet#data_directory = "~/.cache/neosnippet"
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" }}}

" NERDTree settings {{{
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusLine=-1
let g:NERDTreeWinSize=30
let g:NERDTreeHijackNetrw=1
" let NERDTreeMapOpenInTab='<CR>'
" }}}

" NERDCommenter settings {{{
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDAltDelims_haskell=1
" }}}

" CtrlP settings {{{
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden = 0
set wildignore+=*/.gvfs/*,*/.rpmdb/*,*/.cache/*,*/.gconf/*,*/tmp/*,*/.adobe/*,*/.dbus/*,*/.compiz/*,*/.ghc/*,*/.gimp-2.8/*,*/.gnome*/*,*/.gnupg/*,*/.go/*,*/.goldendict/*,*/.google*/*,*/.mozilla/*,*/.ordbrand/*,*/.purple/*,*/.rvm/*,*/.rsvm/*,*/.nvm/*,*/.*cache/*,*/Music/*,*/Videos/*,*/Documents/BOOKS/*,*/Documents/RESEARCH*/*,*/Documents/TORRENTS/*,*/WINDOWS/*,*/PAK/*
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.JPG,*.jpeg,*.JPEG,*.xpm,*.gif,*.pdf,*.beam,*.mp3,*.ogg,*.mp4,*.m4a,*.mkv,*.mov,*.flv,*.oga,*.ogv,*.aac,*.mid,*.flac,*.wav,*.docx,*.doc,*.ppt,*.pptx,*.odt,*.xls,*.xlsx,*.odp,*.ods,*.old,*.log,*.tar.*,*.gz,*.zip,*.deb,*.rar,*.jar,*.pyc,*.pyo,*.gzip,*.7z,*.torrent,*.added,*cache,*.BIOS,*.apk,*.aux,*.gp*,*.sav,*.pls,*.sps,*.cab,*.CAB,*.msi,*.exe,*.epub
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_max_files = 50000
let g:ctrlp_max_depth = 15
let g:ctrlp_open_new_file = 't'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_regexp = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_types = ['mru', 'fil']
" }}}

" Syntastic settings {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4
" let g:syntastic_error_symbol='!!'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_css_checkers = ['']
let g:syntastic_haskell_hdevtools_quiet_messages = {
  \ 'type': 'error',
  \ 'regex': '\mAntigen' }
let g:syntastic_xml_xmllint_quiet_messages = {
  \ 'type': 'error',
  \ 'regex': '\mfonts.dtd' }
" }}}

" Gundo setings {{{
let g:gundo_help = 0
let g:gundo_width = 30
let g:gundo_preview_height = 10
" }}}

" DevIcons settings {{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" }}}

" Misc settings {{{
let g:username='Tamado Ramot Sitohang'
let g:email='tamado.sitohang@gmail.com'
let g:ycm_python_binary_path = 'python'
set pastetoggle=<F2>
set nobackup
set noswapfile
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.html.erb'
" let g:tagbar_left = 1
" let g:tagbar_width = 30
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let g:delimitMate_matchpairs = '(:),[:],{:}'
let g:delimitMate_balance_matchpairs = 0
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
" Called once right before you start selecting multiple cursors
" function! Multiple_cursors_before()
  " if exists(':NeoCompleteLock')==2
    " exe 'NeoCompleteLock'
  " endif
" endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
" function! Multiple_cursors_after()
  " if exists(':NeoCompleteUnlock')==2
    " exe 'NeoCompleteUnlock'
  " endif
" endfunction
" }}}

" Listchars option {{{
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    set listchars=tab:\│\ ,trail:·,extends:>,precedes:<,nbsp:·
    set fillchars=fold:\ ,
endif
set list
" }}}

" Fold text {{{
function! MyFoldText()
  let l:lines = printf('%' . len(line('$')) . 'd', v:foldend - v:foldstart + 1)
  let l:line  = substitute(foldtext(), '^+-\+ *\d\+ lines: ', '', '')
  return '[ ' . l:lines . ' lines: ' . l:line . ' ]'
endfunction
" }}}

" Pretty Title {{{
function! BufferName()
  let l:name_buf = expand('%:t')
  if l:name_buf ==? ''
    let l:name_buf = '[NO NAME]'
  endif
  return l:name_buf
endfunction
" }}}

" Autocommand setings {{{
au BufWritePre        *.*           :%s/\s\+$//e
au FileType           *             setlocal formatoptions-=ro
au BufEnter           *             if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
au FileType           *             set foldtext=MyFoldText()
au FileType           *             set foldmethod=manual
au FileType           python        nnoremap <Leader>= :0,$!yapf<CR>
" au BufWritePost       *.js    silent !standard-format -w %
" au FileType           ruby,eruby    let g:rubycomplete_buffer_loading = 1
" au FileType           ruby,eruby    let g:rubycomplete_classes_in_global = 1
" au FileType           ruby,eruby    let g:rubycomplete_rails = 1
" au FileType           cpp           setlocal omnifunc=omni#cpp#complete#Main
" au FileType           python        setlocal omnifunc=jedi#completions
au FileType           *             let delimitMate_matchpairs="(:),{:},[:]"
au FileType           ruby,eruby    let b:delimitMate_quotes="\" ' ` |"
au BufEnter           *             let &titlestring = BufferName() . "\ \ —\ \ VIM\ \ —\ \ %{&columns}✕%{&lines}"
au BufWritePost       *             let &titlestring = BufferName() . "\ \ —\ \ VIM\ \ —\ \ %{&columns}✕%{&lines}"
au VimResized         *             let &titlestring = BufferName() . "\ \ —\ \ VIM\ \ —\ \ %{&columns}✕%{&lines}"
au FileType           nerdtree      setlocal nolist
au VimLeavePre        *             let @/ = ""
augroup filetype_help
  au BufWinEnter      *             if &l:buftype ==# 'help' | nmap <C-M> <C-]>| endif
augroup END
" }}}

" CSV Plugin {{{
hi link CSVColumnOdd  Normal
hi link CSVColumnEven Normal
let g:csv_highlight_column = 1
let g:csv_autocmd_arrange = 1
" }}}

" Markdown {{{
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
" }}}

source ~/.vim/tagbar.vim
source ~/.vim/keysrc.vim

endif

set t_RV=

" vim:fdm=marker
