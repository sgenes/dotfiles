# zshrc with antigen-hs
# Copyright © 2016 Tamado Ramot Sitohang

# License: MIT
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
export WORKON_HOME=~/Documents/WORKSPACE/VIRTUALENV
export PROJECT_HOME=~/Documents/WORKSPACE/PYTHON

if [[ -z "$ZSH_CACHE_DIR" ]]; then
	ZSH_CACHE_DIR="$ZSH/cache/"
fi

autoload -U colors && colors

source ~/.zsh/antigen-hs/init.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /etc/bash_completion.d/virtualenvwrapper

setopt histignorealldups
# setopt correct

export LESS="-~"
export VISUAL='/usr/local/bin/vim'
export EDITOR='/usr/local/bin/vim'
export SELECTED_EDITOR='/usr/local/bin/vim'
export PATH="$PATH:/home/shinzjr/.bin:/home/shinzjr/.local/bin:/home/shinzjr/.cabal/bin"
export GOPATH="/home/shinzjr/.go"
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS"
export PROMPT_EOL_MARK=""
export PYTHONSTARTUP=~/.pythonrc

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export NVM_DIR="/home/shinzjr/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
export NPM_PACKAGES="/home/shinzjr/.local/share/npm-packages/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:/home/shinzjr/.local/share/man:$(manpath)"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
export DEBEMAIL="tamado.sitohang@gmail.com"
export DEBFULLNAME="Tamado Sitohang"

stty -ixon
stty -ixoff

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export MANPATH="$MANPATH:$HOME/.rvm/man"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s /home/shinzjr/.rsvm/rsvm.sh ]] && . /home/shinzjr/.rsvm/rsvm.sh # This loads RSVM
source $HOME/.zsh/function.zsh
