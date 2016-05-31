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
" Plugin 'jordwalke/flatlandia'
" Plugin 'ajh17/Spacegray.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'eagletmt/neco-ghc'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'jordwalke/VimCompleteLikeAModernEditor'
Plugin 'godlygeek/tabular'
" Plugin 'ryanoasis/vim-devicons'

set rtp+=~/.vim/bundle/tsyntastic
set rtp+=~/.vim/bundle/nerdcommenter
" set rtp+=~/.vim/bundle/vim-template-master
set rtp+=~/.vim/bundle/vim-devicons

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
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
set tabstop=4
set softtabstop=4
set laststatus=2
set t_Co=256
set background=dark
set number
set backspace=2
set linespace=0
set encoding=utf-8
set switchbuf+=usetab,newtab
set grepprg=grep\ -nH\ $*
set cursorline
set ttimeoutlen=50
set scs
set hlsearch
set formatoptions+=or
set expandtab
set sm!
set shortmess+=filmnrxoOtTc
colorscheme MoonMaster

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4
let g:syntastic_error_symbol='!!'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_haskell_checkers = ['ghc_mod']

let g:airline_powerline_fonts = 1
let g:airline_theme='MoonMaster'
let g:airline#extensions#tabline#enabled = 1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let NERDTreeMinimalUI=1
let NERDTreeStatusLine=-1
let NERDTreeWinSize=30
let NERDTreeHijackNetrw=0
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:username='Tamado Ramot Sitohang'
let g:email='tamado.sitohang@gmail.com'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

source ~/.vim/keysrc
