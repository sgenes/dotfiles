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
" Plug 'ramottamado/vim-quantum'
Plug 'ramottamado/vim-colors-github'
" Plug 'ayu-theme/ayu-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'derekwyatt/vim-scala', { 'for' : ['scala', 'sbt.scala'] }
Plug 'neoclide/coc.nvim', { 'branch' : 'release', 'for' : ['scala', 'sbt.scala'] }
Plug 'fatih/vim-go', { 'for' : ['go'], 'do' : ':GoUpdateBinaries' }
Plug 'davidhalter/jedi-vim', { 'for' : ['python'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' : ['python'] }
Plug 'Valloric/YouCompleteMe'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'  " , { 'on' : 'NERDTreeToggle' }
" Plug 'scrooloose/syntastic', { 'for' : ['r'] }
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim', { 'on' : 'GundoToggle' }
Plug 'chrisbra/csv.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'lervag/vimtex', { 'for' : ['tex'] }
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
Plug 'tmsvg/pear-tree', { 'for' : ['ruby', 'eruby', 'html', 'xml', 'markdown'] }
" Plug 'gyim/vim-boxdraw'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
" Plug 'svermeulen/vim-easyclip'
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
" Plug 'terryma/vim-multiple-cursors'
Plug 'plasticboy/vim-markdown'
Plug 'b4b4r07/vim-sqlfmt'
Plug 'junegunn/vim-easy-align'
" Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
" Plug 'tmhedberg/SimpylFold', { 'for' : ['python'] }
Plug 'drzel/vim-line-no-indicator'
" Plug 'jupyter-vim/jupyter-vim', { 'on' : 'JupyterConnect' }
Plug 'farmergreg/vim-lastplace'
Plug 'junegunn/fzf', { 'dir' : '~/.config/fzf', 'do' : './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'airblade/vim-rooter'
call plug#end()
" }}}

" UI settings {{{
" colorscheme MoonMaster
scriptencoding utf-8
filetype plugin on
syntax on
" set notitle
set splitbelow
set splitright
set virtualedit=onemore
set clipboard=unnamedplus
set scrolloff=5
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set copyindent
set preserveindent
set cinoptions=(0,u0,U0
set laststatus=2
set wmnu
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=light
" let ayucolor='mirage'
" let g:quantum_black=1
" colorscheme ayu
" let g:quantum_italics=1
" colorscheme quantum
let g:github_colors_soft = 0
colorscheme github
hi Comment gui=italic
hi EndOfBuffer ctermfg=1 guifg=#ffffff guibg=#ffffff
" hi Pmenu guibg=#292929
" hi clear PmenuSel
" hi PmenuSel cterm=reverse gui=reverse guibg=#292929 guifg=#b7bdc0
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
set updatetime=300
set nowrap
set history=10000
" set wrapmargin=0
set nolinebreak
set autoread
" set hidden
set shortmess+=c
" set noshowmode
set title
set mouse=a
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
let g:polyglot_disabled = ['css', 'python', 'haskell']
let g:gitgutter_signs = 1
let g:sh_no_error = 1
let g:tex_conceal = ''
let g:EasyClipEnableBlackHoleRedirect=0
let g:tagbar_show_visibility = 0
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_expand = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_indent = 2
let g:tagbar_iconchars = ['▶ ', '▼ ']
" hi TagbarKind term=bold ctermfg=0 cterm=bold gui=bold guifg=#d3dae3
hi link TagbarFoldIcon Directory
hi link TagbarScope TagbarKind
let g:terminal_ansi_colors = [
  \ "#ffffff", "#b31d28", "#22863a", "#e36209",
  \ "#032f62", "#45267d", "#669cc2", "#24292e",
  \ "#41484f", "#d73a49", "#3ebc5c", "#f18338",
  \ "#005cc5", "#6f42c1", "#669cc2", "#6a737d"
  \]
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
" let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽']
let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽']
let g:airline_skip_empty_sections = 0
let g:airline_section_x = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{&filetype} %{airline#util#wrap(airline#parts#ffenc(),0)}'
let g:airline_section_y = '%{LineNoIndicator()}'
let g:airline_section_z = '%2v'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'ayu_mirage'
" let g:airline_theme = 'quantum'
let g:airline_theme = 'github'
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
let g:airline_symbols.crypt = ' '
let g:airline_symbols.notexists = ' ✘'
let g:airline_symbols.dirty=' '
let g:airline#extensions#tabline#formatter = 'unique_tail'
" }}}

" ALE settings {{{
let g:ale_lint_on_save = 1
let g:ale_vim_vint_show_style_issues = 0
let g:ale_linters = {
  \   'go': ['gofmt', 'golint', 'go vet'],
  \   'hack': ['hack'],
  \   'python': ['pycodestyle', 'flake8'],
  \   'rust': ['cargo'],
  \   'vue': ['eslint', 'vls'],
  \   'zsh': ['shell'],
  \}
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = '--ignore=E501'
" }}}

" UltiSnips settings {{{
" let g:UltiSnipsExpandTrigger = '<F10>'
" let g:UltiSnipsJumpForwardTrigger = '<Tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
" let g:ulti_expand_or_jump_res = 0
" function! <SID>ExpandSnippetOrReturn()
  " let b:snippet = UltiSnips#ExpandSnippetOrJump()
  " if g:ulti_expand_or_jump_res > 0
    " return b:snippet
  " else
    " return '\<CR>'
  " endif
" endfunction
" imap <expr> <CR> pumvisible() ? '<C-R>=<SID>ExpandSnippetOrReturn()<CR>' : '\<Plug>(PearTreeExpand)'
" }}}

" Completion settings {{{
" set tags+=~/.vim/tags
set completeopt-=preview
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 0 " Completion in comments
let g:ycm_complete_in_strings = 0 " Completion in string
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_interpreter_path = ''
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
let g:ycm_semantic_triggers = {
  \   'python': [ 're!\w{1}' ],
  \   'go': [ 're!\w{1}' ],
  \ }
let g:ycm_filetype_blacklist = {
  \   'scala' : 1,
  \ }
let g:ycm_python_binary_path = 'python3'
let g:ycm_max_num_candidates = 10
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_modes = 'i'
let g:jedi#goto_command = "<C-]>"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" let g:ycm_key_list_stop_completion = ['<C-y>', '<Right>']
let g:ycm_key_list_previous_completion=[]
imap <expr> <CR> pumvisible()
      \ ? "\<C-Y>"
      \ : "<Plug>delimitMateCR"
imap <expr> <S-Tab> pumvisible()
      \ ? "\<C-P>"
      \ : "<Plug>delimitMateS-Tab"
imap <expr> <BS> "<Plug>delimitMateBS"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_imports_autosave = 0
let g:coc_node_path = "~/.local/share/nodenv/shims/node"
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" }}}

" NERDTree settings {{{
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusLine=-1
let g:NERDTreeWinSize=30
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen = 1
" let NERDTreeMapOpenInTab='<CR>'
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeBookmarksFile = '/home/ramot/.config/.NERDTreeBookmarks'
" }}}

" NERDCommenter settings {{{
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces=1
let g:NERDAltDelims_haskell=1
let g:NERDCustomDelimiters = {
      \ 'python': { 'left': '#', 'right': '' }
      \ }
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
let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Directory'],
  \ 'info':    ['fg', 'Directory'],
  \ 'prompt':  ['fg', 'Operator'],
  \ 'pointer': ['fg', 'String'],
  \ 'marker':  ['fg', 'Statement'],
  \ 'spinner': ['fg', 'Type'] }
command! -bang -nargs=? -complete=dir Directories
      \ call fzf#vim#files(<q-args>, {'options': ['--prompt=> ']}, <bang>0)
" }}}

" Misc settings {{{
let g:username='Tamado Ramot Sitohang'
let g:email='ramottamado@gmail.com'
set pastetoggle=<F2>
set nobackup
set nowritebackup
" set cmdheight=2
set signcolumn=yes
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
let g:scala_sort_across_groups=1
" let g:pear_tree_smart_openers = 1
" let g:pear_tree_smart_closers = 1
" let g:pear_tree_smart_backspace = 1
" let g:pear_tree_repeatable_expand = 0
" let g:pear_tree_map_special_keys = 0
" imap <BS> <Plug>(PearTreeBackspace)
" imap <Esc> <Plug>(PearTreeFinishExpansion)
" imap <Space> <Plug>(PearTreeSpace)
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
let g:rooter_patterns = ['build.sbt', '.git/', '.python-version', 'Rakefile']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"
" }}}

" {{{ CtrlP
" let g:ctrlp_map = '<C-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_by_filename = 1
" let g:ctrlp_regexp = 1
" let g:ctrlp_use_caching = 1
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_show_hidden = 0
" set wildignore+=*/.gvfs/*,*/.rpmdb/*,*/.cache/*,*/.gconf/*,*/tmp/*,*/.adobe/*,*/.dbus/*,*/.compiz/*,*/.ghc/*,*/.gimp-2.8/*,*/.gnome*/*,*/.gnupg/*,*/.go/*,*/.goldendict/*,*/.google*/*,*/.mozilla/*,*/.ordbrand/*,*/.purple/*,*/.rvm/*,*/.rsvm/*,*/.nvm/*,*/.*cache/*,*/Music/*,*/Videos/*,*/Documents/books/*,*/Downloads/*
" set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.JPG,*.jpeg,*.JPEG,*.xpm,*.gif,*.pdf,*.beam,*.mp3,*.ogg,*.mp4,*.m4a,*.mkv,*.mov,*.flv,*.oga,*.ogv,*.aac,*.mid,*.flac,*.wav,*.docx,*.doc,*.ppt,*.pptx,*.odt,*.xls,*.xlsx,*.odp,*.ods,*.old,*.log,*.tar.*,*.gz,*.zip,*.deb,*.rar,*.jar,*.pyc,*.pyo,*.gzip,*.7z,*.torrent,*.added,*cache,*.BIOS,*.apk,*.aux,*.gp*,*.sav,*.pls,*.sps,*.cab,*.CAB,*.msi,*.exe,*.epub
" let g:ctrlp_extensions = ['tag', 'buffertag', 'dir', 'mixed',
                          " \ 'bookmarkdir']
" let g:ctrlp_match_window = 'bottom,order:btt'
" let g:ctrlp_working_path_mode='ra'
" let g:ctrlp_max_files = 50000
" let g:ctrlp_max_depth = 15
" let g:ctrlp_open_new_file = 't'
" let g:ctrlp_follow_symlinks = 1
" let g:ctrlp_regexp = 0
" let g:ctrlp_by_filename = 1
" let g:ctrlp_types = ['mru', 'fil']
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
" augroup autoremove_trail
  " au BufWritePre        *.*           :%s/\s\+$//e
" augroup END
augroup scala_sbt
  " au BufRead,BufNewFile *.sbt         set filetype=scala
  au FileType           json          syntax match Comment +\/\/.\+$+
  au FileType           scala         nmap <silent>.  <Plug>(coc-definition)<cr>
  au FileType           scala         nmap <leader>rn <Plug>(coc-rename)<cr>
  au FileType           scala         xmap <leader>f  <Plug>(coc-format-selected)<cr>
  au FileType           scala         nmap <leader>f  <Plug>(coc-format-selected)<cr>
  au FileType           scala         nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  au FileType           scala         nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  au FileType           scala         nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  au FileType           scala         nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  au FileType           scala         nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  au FileType           scala         nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  au FileType           scala         nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  au FileType           scala         nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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
augroup pairing
  au FileType           ruby,eruby    let b:loaded_delimitMate = 1
  au FileType           *             let delimitMate_matchpairs="(:),{:},[:]"
  " au FileType           ruby,eruby    let b:delimitMate_quotes="\" ' ` |"
augroup END
" augroup python
  " au FileType           python        set ts=4
  " au FileType           python        set sw=4
" augroup END
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
  au FileType           html,markdown let b:loaded_delimitMate = 1
  " au FileType           html          let g:delimitMate_quotes = "` ' \" %"
  " au FileType           markdown      let g:delimitMate_quotes = "` ' \" % *"
augroup END
augroup xml
  au FileType           xml           let b:loaded_delimitMate = 1
  au FileType           xml           set noet
  au FileType           xml           let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
      \ '<*>': {
      \     'closer': '</*>',
      \   }
      \ }, 'keep')
augroup END
augroup ycm
  autocmd CmdwinEnter   *             inoremap <expr><buffer> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
augroup END
augroup fzf
  autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
" augroup autocd
  " autocmd BufEnter * silent! lcd %:p:h
" augroup END
" }}}

" CSV Plugin {{{
hi link CSVColumnOdd  Normal
hi link CSVColumnEven Normal
let g:csv_delim = ','
let g:csv_nl = 1
let g:csv_highlight_column = 1
let g:csv_autocmd_arrange = 1
" }}}

" Markdown {{{
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
" }}}

source ~/.vim/tagbar.vim
source ~/.vim/keysrc.vim

endif

" set stal=2
set t_RV=
set t_SH=

" vim:fdm=marker
