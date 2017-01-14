# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
alias q='exit'
alias quit='exit'
alias :q='exit'
alias c='clear'
alias wip='cd $HOME/Documents/WORKSPACE'
alias vimpath='cd $HOME/Documents/WORKSPACE/GIT/vim'
alias dotfiles='cd $HOME/Documents/DOTFILES'
alias gitfolder='cd $HOME/Documents/WORKSPACE/GIT'
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias snap='sudo snap'
alias gitinit='git init && git add -A && git commit -m "Initial Commit"'
alias ccompile='g++ -Wall '

alias editrc='$VISUAL $HOME/.zshrc'

# reload zshrc
function reload()
{
  local cache=$ZSH_CACHE_DIR
  autoload -U compinit zrecompile
  compinit -d "$cache/zcomp-$HOST"

  for f in ~/.zshrc "$cache/zcomp-$HOST"; do
    zrecompile -p $f && command rm -f $f.zwc.old
  done

  source ~/.zshrc
}

#bindkey '^[[1;5A' history-beginning-search-backward
#bindkey '^[[1;5B' history-beginning-search-forward

unsetopt no_match
