# define general things here

# define zsh home
ZSH="$HOME/.zsh"

# define zsh cache
ZSH_CACHE_DIR="$ZSH/cache/"

# autoload
autoload -Uz add-zsh-hook
autoload -U colors && colors
autoload -U compinit
autoload -Uz vcs_info

# zmodload
zmodload -i zsh/complist
zmodload zsh/datetime
zmodload zsh/parameter
zmodload zsh/zle

# set environment
export PROMPT_EOL_MARK=""

export VIRTUAL_ENV_DISABLE_PROMPT=1 # disable venv prompt
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/workspace/python
export PYTHONSTARTUP=~/.pythonrc
export MPD_PORT="6600"

export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'    # Use GTK for Java
export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS" # Applications

export PAGER="less"
export LESS="-~R" # output raw control chars
export VISUAL='/usr/local/bin/vim'
export EDITOR='/usr/local/bin/vim'
export SELECTED_EDITOR='/usr/local/bin/vim'
export DEBEMAIL="tamado.sitohang@gmail.com"
export DEBFULLNAME="Tamado Sitohang"
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.cabal/bin:$PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"

export MANPATH="$NPM_PACKAGES/share/man:$HOME/.local/share/man:$MANPATH"
export MANPATH="$HOME/.rvm/man:$MANPATH"

export NVM_DIR="$HOME/.nvm"
export RVM_DIR="$HOME/.rvm"

export NPM_PACKAGES="$HOME/.local/share/npm-packages/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export GOPATH="$HOME/.go"
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

# rubygems, rvm and nvm
export rvm_funcs=(rvm ruby irb gem erb rdoc rake ri rvm-prompt jekyll t)
export nvm_funcs=(nvm node npm prettycss standard markdown-pdf learnyounode javascripting csslint coffee http-server)

# sourcing
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
eval `dircolors $ZSH/dircolors`
source $ZSH/function.zsh
fpath+=/home/ramot/.zsh/function

# antigen init
if [[ $TERM == "xterm-256color" || $TERM == "screen-256color" ]]; then
  source $ZSH/antigen-hs/init.zsh
else
  source $ZSH/plugins/history/history.plugin.zsh
fi

# show todo
if [[ $(todo) != '' ]]; then
 JOAO="$fg_bold[white]TODO:$reset_color"
 echo $JOAO
 todo --filter -done +children
fi

# stop mapping Ctrl+S
# stty -ixon
# stty -ixoff

# key-binding for tmux
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# completion
compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
