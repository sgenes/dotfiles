# define general things here

# define zsh home
ZSH="$HOME/.config/zsh"

# define zsh cache
ZSH_CACHE_DIR="$ZSH/cache"

# autoload
autoload -Uz add-zsh-hook
autoload -U colors && colors
autoload -Uz vcs_info
autoload -U compinit

# zmodload
zmodload -i zsh/complist
zmodload zsh/datetime
zmodload zsh/parameter
zmodload zsh/zle

# set environment
export PROMPT_EOL_MARK=""

export VIRTUAL_ENV_DISABLE_PROMPT=1 # disable venv prompt
# export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME="$HOME/Documents/workspace/python"
export PYTHONSTARTUP=~/.pythonrc
export PYENV_ROOT="$HOME/.local/share/pyenv"
export RBENV_ROOT="$HOME/.local/share/rbenv"
export NODENV_ROOT="$HOME/.local/share/nodenv"
export MPD_PORT="6600"
export GOPATH="$HOME/Documents/workspace/go"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'    # Use GTK for Java
# export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS" # Applications

export PAGER="less"
export LESS="-~R" # output raw control chars
export VISUAL='/usr/bin/vim'
export EDITOR='/usr/bin/vim'
export SELECTED_EDITOR='/usr/bin/vim'
export DEBEMAIL="ramot@ramottamado.dev"
export DEBFULLNAME="Tamado Sitohang"
# export LSCOLORS="Gxfxcxdxbxegedabagacad"

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export AUTOSWITCH_SILENT=1

export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$HOME/.bin:$HOME/.local/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$NODENV_ROOT/bin:$PATH"

# export GEM_HOME="$HOME/.gem/ruby/2.5.0"

# export MANPATH="$NPM_PACKAGES/share/man:$HOME/.local/share/man:$MANPATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

# if which ruby >/dev/null && which gem >/dev/null; then
  # PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
# fi

# export NPM_PACKAGES="$HOME/.local/share/npm-packages/.npm-packages"
# export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"

if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

# sourcing
eval `dircolors $ZSH/dircolors`
source $ZSH/function.zsh
fpath+=$ZSH/function

# init
if [[ $TERM == "xterm-256color" || $TERM == "screen-256color" ]]; then
  source $ZSH/init.zsh
else
  source $ZSH/plugins/history/history.plugin.zsh
fi

# show todo
# if [[ $(todo) != '' ]]; then
 # JOAO="$fg_bold[white]TODO:$reset_color"
 # echo $JOAO
 # todo --filter -done +children
# fi

# show fortune
# if [[ $TERM == "xterm-256color" || $TERM == "screen-256color" ]]; then
  # local fortune=$(fortune $HOME/Documents/resources/fortune/bible/proverbs)
  # echo "$fg_bold[green]$fortune$reset_color"
# fi

# stop mapping Ctrl+S
# stty -ixon
# stty -ixoff

# key-binding for tmux
# bindkey '\e[1~'   beginning-of-line   # Linux console
# bindkey '\e[H'    beginning-of-line   # xterm
# bindkey '\eOH'    beginning-of-line   # gnome-terminal
# bindkey '\e[2~'   overwrite-mode      # Linux console, xterm, gnome-terminal
# bindkey '\e[3~'   delete-char         # Linux console, xterm, gnome-terminal
# bindkey '\e[4~'   end-of-line         # Linux console
# bindkey '\e[F'    end-of-line         # xterm
# bindkey '\eOF'    end-of-line         # gnome-terminal

# if [[ $TERM == 'xterm' || $TERM == 'xterm-256color' ]]; then
  # echo -e -n "\x1b[\x35 q"              # xterm cursor
# fi

# zsh-autosuggestions
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=send-break  # fix no bell sound on Ctrl-G

# virtualenv
# VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# gitignore
function gitignore() {
  curl -sL https://www.gitignore.io/api/$1 -o .gitignore
}

# fzf
[ -f ~/.config/fzf.zsh ] && source ~/.config/fzf.zsh
export FZF_DEFAULT_OPTS='
  --color fg:#6a737d,hl:12,fg+:7,bg+:#fffbdd,hl+:12
  --color info:9,prompt:12,pointer:9,spinner:4,marker:13
  --color border:#eceef1,header:4
  --height 100% --no-bold --reverse
'
export FZF_CTRL_T_OPTS='--prompt=\/\ '
export FZF_CTRL_R_OPTS="--expect=ctrl-i"
bindkey '^E' fzf-cd-widget
function _fo() {
  local sel
  sel=($(__fsel))
  sel=$(head -2 <<< "$sel" | tail -1)
  if [ -n "$sel" ]; then
    xdg-open $sel
  fi
  zle reset-prompt
}
zle -N _fo
bindkey '^F' _fo

# vim terminal
[[ -n "$VIM" ]] && echo -e -n "\x1b[\x35 q"

# conda
# . "/home/ramot/.miniconda/etc/profile.d/conda.sh"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# nodenv
eval "$(nodenv init -)"

# rbenv
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ramot/.local/share/sdkman"
[[ -s "/home/ramot/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "/home/ramot/.local/share/sdkman/bin/sdkman-init.sh"

# completion
for dump in $ZSH_CACHE_DIR/zcompdump(N.mh+24); do
  compinit -d $ZSH_CACHE_DIR/zcompdump
done

compinit -C -d $ZSH_CACHE_DIR/zcompdump

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $GOPATH/bin/gocomplete go
