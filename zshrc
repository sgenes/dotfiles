ZSH="$HOME/.zsh"

if [[ -z "$ZSH_CACHE_DIR" ]]; then
	ZSH_CACHE_DIR="$ZSH/cache/"
fi

autoload -U colors && colors

export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/WORKSPACE/PYTHON
export PATH="$HOME/.bin:$HOME/.bin/platform-tools:$HOME/.local/bin:$HOME/.cabal/bin:$PATH"
export GOPATH="$HOME/.go"
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'    # Use GTK for Java
export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS" # Applications
export PROMPT_EOL_MARK=""
export PYTHONSTARTUP=~/.pythonrc

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

export NPM_PACKAGES="$HOME/.local/share/npm-packages/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$HOME/.local/share/man:$MANPATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export MANPATH="$HOME/.rvm/man:$MANPATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source $ZSH/function.zsh
source $ZSH/autopair.zsh
fpath+=/home/ramot/.zsh/function

# antigen init
if [[ $TERM == "xterm-256color" || $TERM == "screen-256color" ]]; then
	source $ZSH/antigen-hs/init.zsh
else
	source $ZSH/plugins/history/history.plugin.zsh
fi
# if [[ $(todo) != '' ]]; then
#	 JOAO="$fg_bold[white]TODO:$reset_color"
#	 echo $JOAO
#	 todo --filter -done +children
# fi
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /etc/bash_completion.d/virtualenvwrapper

# setopt histignorealldups
# setopt correct

if [[ $TERM == "xterm-256color" || $TERM == "screen-256color" ]]; then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
	ZSH_HIGHLIGHT_STYLES[path]=fg=39
	ZSH_HIGHLIGHT_STYLES[path_prefix]=none
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=226
	ZSH_HIGHLIGHT_STYLES[assign]=fg=10
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=11
	ZSH_HIGHLIGHT_STYLES[comment]=fg=7
	export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
fi

export LESS="-~R" # output raw control chars
export VISUAL='/usr/local/bin/vim'
export EDITOR='/usr/local/bin/vim'
export SELECTED_EDITOR='/usr/local/bin/vim'
eval `dircolors $ZSH/dircolors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:tasks:*' list-colors "=(#b) #([^ ]#)*=$color[white]=$color[yellow]=$color[red]"
# zstyle ':completion:*:options' list-colors "=^(-- *)=0;36"
# zstyle ':completion:*:parameters'  list-colors '=*=32'
# zstyle ':completion:*:builtins' list-colors '=*=1;33;5;142'
# setopt menu_complete
export DEBEMAIL="tamado.sitohang@gmail.com"
export DEBFULLNAME="Tamado Sitohang"

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
