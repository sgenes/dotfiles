# zshrc with antigen-hs
# Copyright © 2016 Tamado Ramot Sitohang

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

ZSH="$HOME/.zsh"

if [[ -z "$ZSH_CACHE_DIR" ]]; then
	ZSH_CACHE_DIR="$ZSH/cache/"
fi

autoload -U colors && colors

source ~/.zsh/antigen-hs/init.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt histignorealldups
export VISUAL='/usr/local/bin/vim'
export EDITOR='/usr/local/bin/vim'
export SELECTED_EDITOR='/usr/local/bin/vim'
export PATH=$PATH:/home/tama/.bin:/home/tama/.local/bin
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS"
export PROMPT_EOL_MARK=""

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
alias dotfiles='cd ~/Documents/DOTFILES'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
