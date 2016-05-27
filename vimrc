set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jordwalke/flatlandia'
Plugin 'ajh17/Spacegray.vim'
Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'lukerandall/haskellmode-vim'
" Plugin 'ervandew/supertab'
" Plugin 'tpope/vim-surround'
Plugin 'eagletmt/neco-ghc'
Plugin 'flazz/vim-colorschemes'
" Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete'
" Plugin 'jordwalke/AutoComplPop'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/closetag.vim'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'scrooloose/syntastic'
Plugin 'jordwalke/VimCompleteLikeAModernEditor'
Plugin 'godlygeek/tabular'
"Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set rtp+=~/.vim/bundle/tsyntastic
set rtp+=~/.vim/bundle/vim-template-master
set rtp+=~/.vim/bundle/vim-devicons
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
"set ve=block
set tabstop=4
set noswapfile
set laststatus=2
set t_Co=256
"set termguicolors
set background=dark
colorscheme MoonMaster
"colorscheme spacegray
"colorscheme flatlandia
set number
set backspace=2

set linespace=0

set encoding=utf-8

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4
let g:syntastic_error_symbol='!!'

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypers": [],
    \ "passive_filetypes": ["html"]}
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_html_checkers = ['validator']
let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_haskell_checkers = ['ghc_mod']

let g:airline_powerline_fonts = 1
let g:airline_theme='MoonMaster'
"let g:airline_theme='flatlandia'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

let NERDTreeMinimalUI=1
let NERDTreeStatusLine=-1
let NERDTreeWinSize=30
"let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:netrw_banner=0

let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:username='Tamado Ramot Sitohang'
let g:email='tamado.sitohang@gmail.com'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()

let mapleader=","
map <silent><C-e>		:NERDTreeToggle<CR>
map <silent><C-n>		:tabnew<CR>
nmap <silent><TAB>		:tabnext<CR>
nmap <silent><S-TAB>		:tabprev<CR>
nmap 			:conf q<CR>
imap 			<C-o>:conf q<CR>
nmap 			:w<CR>
inoremap <silent><c-s> <C-o>:update<CR>
nmap z			u
imap z			<C-o>u
nmap y			<C-R>
imap <C-l>			<Esc><Esc>
vmap <C-l>			<Esc><Esc>
nmap .				<C-]>
nmap \				<C-o>
nmap 				,ci
vmap 				,ci
imap 				<C-o>,ci
nmap [1;3C]			%
nnoremap <silent>-		<C-w>-
nnoremap <silent>+		<C-w>+
nnoremap <silent>=		<C-w>=
map <C-S-Down>			<C-w><C-w>
map <C-S-Up>			<C-w>w
"nnoremap <silent><S-q>		:q<CR>
"nmap <silent><C-\>		%
nmap <silent><S-Space>	 	:bp<CR>
nmap <silent><Space>		:bnext<CR>
nmap <silent><C-Del>				:bdelete<CR>
nmap <silent><Del>		:tabclose<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
inoremap <expr><TAB> pumvisible() ? "\<C-n><C-y>" : "\<C-R>=UltiSnips#ExpandSnippet()"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set cursorline
set ttimeoutlen=50
