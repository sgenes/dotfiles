" ============================= "
" ViM configuration file        "
" Author: Tamado Ramot Sitohang "
" License: MIT                  "
" ============================= "
if has ('gui_running') || &term ==# 'xterm-256color' || &term ==# 'screen-256color'

" vim-plug {{{
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'jacoborus/tender.vim'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ayu-theme/ayu-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'flazz/vim-colorschemes'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neoinclude.vim'
" Plug '~/.vim/bundle-local/golden-ratio'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
" Plug 'mcchrish/nnn.vim'
" Plug 'scrooloose/syntastic', { 'for' : ['r'] }
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim', { 'on' : 'GundoToggle' }
Plug 'chrisbra/csv.vim', { 'for' : ['csv'] }
" Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex', { 'for' : ['tex'] }
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
" Plug 'svermeulen/vim-easyclip'
Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
" Plug '~/.vim/bundle-local/vim-devicons'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
" Plug 'tmhedberg/SimpylFold', { 'for' : ['python'] }
Plug 'drzel/vim-line-no-indicator'
" Plug 'sunaku/vim-dasht'
Plug 'wmvanvliet/jupyter-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()
" }}}

" UI settings {{{
" colorscheme MoonMaster
scriptencoding utf-8
syntax on
" set notitle
set splitbelow
set splitright
set virtualedit=onemore
set clipboard=unnamedplus
set scrolloff=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
" set t_Co=256
set termguicolors
set background=dark
let ayucolor='mirage'
let g:quantum_black=1
" colorscheme ayu
colorscheme quantum
hi NonText ctermfg=1 guifg=#212121
set number
set backspace=2
" set switchbuf+=usetab,newtab
set grepprg=grep\ -nH\ $*
set cursorline
set ttimeoutlen=50
set smartcase
set hlsearch
set incsearch
set formatoptions=cql
set showmatch!
set updatetime=4000
set nowrap
set history=10000
" set wrapmargin=0
set nolinebreak
set autoread
" set hidden
set shortmess+=c
" set noshowmode
set title
let g:polyglot_disabled = ['css', 'python', 'haskell']
let g:gitgutter_signs = 1
let g:sh_no_error = 1
let g:tex_conceal = ''
let g:EasyClipEnableBlackHoleRedirect=0
let g:tagbar_show_visibility = 0
let g:tagbar_compact = 1
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_indent = 3
let g:tagbar_iconchars = ['▶ ', '▼ ']
" hi TagbarKind term=bold ctermfg=0 cterm=bold gui=bold guifg=#d3dae3
hi link TagbarFoldIcon Directory
hi link TagbarScope TagbarKind
" }}}

" Airline settings {{{
let g:airline#extensions#default#section_truncate_width = {}
      " \ 'y': 79,
      " \ }
      " \ 'c': 60,
      " \ 'y': 45,
      " \ 'z': 80,
      " \ 'warning': 80,
      " \ 'error': 80,
      " \ }
let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽']
let g:airline_skip_empty_sections = 1
let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{&filetype}'
let g:airline_section_y = '%{LineNoIndicator()}'
let g:airline_section_z = '%2v'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'ayu_mirage'
let g:airline_theme = 'quantum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
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
let g:airline_symbols.crypt = ''
let g:airline_symbols.notexists = ' '
" }}}

" ALE settings {{{
let g:ale_lint_on_save = 1
let g:ale_vim_vint_show_style_issues = 0
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'elixir': ['credo', 'dialyxir', 'dogma', 'elixir-ls'],
  \   'go': ['gofmt', 'golint', 'go vet'],
  \   'hack': ['hack'],
  \   'help': [],
  \   'perl': ['perlcritic'],
  \   'perl6': [],
  \   'python': ['flake8'],
  \   'rust': ['cargo'],
  \   'spec': [],
  \   'text': [],
  \   'vue': ['eslint', 'vls'],
  \   'zsh': ['shell'],
  \}
let g:ale_python_flake8_executable = 'flake8'
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
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python3'
let g:ycm_key_list_stop_completion = ['<Right>']
let g:ycm_max_num_candidates = 10
let g:jedi#show_call_signatures = "0"
" }}}

" NERDTree settings {{{
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusLine=-1
let g:NERDTreeWinSize=30
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen = 1
" let NERDTreeMapOpenInTab='<CR>'
" }}}

" NERDCommenter settings {{{
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDAltDelims_haskell=1
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
let g:gundo_prefer_python3 = 1
" }}}

" DevIcons settings {{{
" let g:WebDevIconsUnicodeDecorateFolderNodes = 0
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:webdevicons_enable_airline_statusline = 0
" let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
" }}}

" FZF Settings {{{
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}

" Misc settings {{{
let g:username='Tamado Ramot Sitohang'
let g:email='ramottamado@gmail.com'
set pastetoggle=<F2>
set nobackup
" set noswapfile
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.html.erb,*.md,*.svg'
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
" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF
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
augroup autoremove_trail
  au BufWritePre        *.*           :%s/\s\+$//e
augroup END
augroup markdown_formatting
  au FileType           markdown      setlocal wrap
augroup END
augroup formatting
  au FileType           *             setlocal formatoptions-=ro
augroup END
augroup nerd_tree
  au BufEnter           *             if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  au FileType           nerdtree      setlocal nolist
augroup END
augroup folding
  au FileType           *             set foldtext=MyFoldText()
  au FileType           *             set foldmethod=manual
  " au FileType           python        nnoremap <Leader>= :0,$!yapf<CR>
augroup END
" au BufWritePost       *.js    silent !standard-format -w %
" au FileType           ruby,eruby    let g:rubycomplete_buffer_loading = 1
" au FileType           ruby,eruby    let g:rubycomplete_classes_in_global = 1
" au FileType           ruby,eruby    let g:rubycomplete_rails = 1
" au FileType           cpp           setlocal omnifunc=omni#cpp#complete#Main
" au FileType           python        setlocal omnifunc=jedi#completions
augroup pairing
  au FileType           *             let delimitMate_matchpairs="(:),{:},[:]"
  au FileType           ruby,eruby    let b:delimitMate_quotes="\" ' ` |"
augroup END
augroup title_string
  au BufEnter           *             let &titlestring = BufferName() . "\ \ —\ \ VIM"
  au BufWritePost       *             let &titlestring = BufferName() . "\ \ —\ \ VIM"
  au VimResized         *             let &titlestring = BufferName() . "\ \ —\ \ VIM"
augroup END
augroup clipboard_opt
  au VimLeavePre        *             let @/ = ""
augroup END
augroup filetype_help
  au BufWinEnter        *             if &l:buftype ==# 'help' | nmap <C-M> <C-]>| endif
augroup END
augroup zsh
  au FileType           zsh           set ts=2
  au FileType           zsh           set sts=2
  au FileType           zsh           set sw=2
  au FileType           zsh           set expandtab
augroup END
augroup jekyll
  au FileType           html          let g:delimitMate_quotes = "` ' \" %"
  au FileType           markdown      let g:delimitMate_quotes = "` ' \" % *"
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

" set stal=2
set t_RV=
set t_SH=

" vim:fdm=marker
