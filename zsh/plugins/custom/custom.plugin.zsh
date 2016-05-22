# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
alias q='exit'
alias quit='exit'
alias c='clear'
#alias vim='nano'

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
