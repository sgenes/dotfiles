alias q='exit'
alias quit='exit'
alias :q='exit'
alias c='clear'
alias wip='cd $HOME/Documents/workspace'
alias vimpath='cd $HOME/Documents/workspace/git/vim'
alias dotfiles='cd $HOME/Documents/dotfiles'
alias projects='cd $HOME/Documents/workspace/git'
alias skripsi='cd $HOME/Documents/workspace/python/skripsi'
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias gitinit='git init && git add -A && git commit -m "Initial Commit"'
alias fuck='sudo'
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'
alias browsedir='browse . &> /dev/null'
alias ls='ls --color=tty'

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    PATH="$HOME/bin:$PATH" \
    man "$@"
}

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

# zsh highlight
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
