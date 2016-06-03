ZSH="$HOME/.zsh"

if [[ -z "$ZSH_CACHE_DIR" ]]; then
	ZSH_CACHE_DIR="$ZSH/cache/"
fi

autoload -U colors && colors

source ~/.zsh/antigen-hs/init.zsh

export VISUAL='/usr/local/bin/vim'
export EDITOR='/usr/local/bin/vim'
export SELECTED_EDITOR='/usr/local/bin/vim'
export PATH=$PATH:/home/tama/.bin:/home/tama/.local/bin
setopt histignorealldups

#export PROMPT_EOL_MARK=""

export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS"

function command_not_found_handler {
	if [[ -x /usr/lib/command-not-found ]] ; then
		/usr/lib/command-not-found -- "$1"
		return 0
	else
		printf "%s: command not found\n" "$1" >&2
		return 127
	fi
}

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

stty stop ''
stty start ''
stty -ixon
stty -ixoff

export NVM_DIR="/home/tama/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NPM_PACKAGES="/home/tama/.local/share/npm-packages/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias vimpath='cd ~/Documents/WORKSPACE/GIT/vim'
alias wip='cd ~/Documents/WORKSPACE'
