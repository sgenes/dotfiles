# oh-my-zsh Bureau Theme

setopt prompt_subst

ZSH_THEME_NVM_PROMPT_PREFIX="[%{$fg[green]%}%B⬡ %b "
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}]"

### Git [git: master ▾●]

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[green]%}git: %{$reset_color%}%{$fg_bold[black]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
ZSH_SUSPEND="[%{$fg[yellow]%}SUS%{$reset_color%}]"

suspend_symbol () {
  local _suspended=""
  if [[ $(jobs -l | wc -l ) -gt 0 ]]; then
    _suspended="$ZSH_SUSPEND"
  fi
  echo $_suspended
}

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi
  if [[ $_STATUS == "" ]]; then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}

local AVAILABLE_WIDTH
((AVAILABLE_WIDTH=$COLUMNS - 23))

_PATH="in %B%$AVAILABLE_WIDTH<..<%c%<<%b"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
  _LIBERTY2="%_ %{$fg[red]%}>"
  _LIBERTY3="%{$fg[red]%}?>"
else
  _USERNAME="%B%n%b"
  _LIBERTY="%{$fg[green]%}$"
  _LIBERTY2="%_ %{$fg[green]%}>"
  _LIBERTY3="%{$fg[green]%}?>"
fi
_USERNAME="$_USERNAME%{$reset_color%} at %{$fg_bold[blue]%}%m%{$reset_color%}"
_LIBERTY="$_LIBERTY%{$reset_color%}"
_LIBERTY2="$_LIBERTY2%{$reset_color%}"
_LIBERTY3="$_LIBERTY3%{$reset_color%}"

# get_space () {
  # local STR=$1$2
  # local zero='%([BSUbfksu]|([FB]|){*})'
  # local LENGTH=${#${(S%%)STR//$~zero/}}
  # local SPACES=""
  # (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  # for i in {0..$LENGTH}
    # do
      # SPACES="$SPACES "
    # done

  # echo $SPACES
# }

return_status () {
    local return_code="%(?..[%{$fg[red]%}%?%{$reset_color%}])"
    return_code="$return_code"
    echo $return_code
}

ssh_prompt_info () {
    local prompt_host=""
    if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host=""
        echo $prompt_host
    else
        prompt_host="[%Bssh:%b %{$fg_bold[blue]%}$(hostname -s)%{$reset_color%}]"
        echo $prompt_host
    fi
}

# if [[ $(date '+%p') == 'PM' ]]; then
    # _PMAM="%{$fg[yellow]%}PM%{$reset_color%}"
# else
    # _PMAM="%{$fg[green]%}AM%{$reset_color%}"
# fi

_1LEFT="$_USERNAME $_PATH"
# _1RIGHT="[%{$fg[cyan]%}%D{%L:%M}%{$reset_color%} $_PMAM %{$reset_color%}%D{%z}%{$reset_color%}] "
# _1RIGHT="[%{$fg[cyan]%}%D{%L:%M}%{$reset_color%} $_PMAM]"

PROMPT="$_1LEFT
$_LIBERTY "
RPROMPT='$(nvm_prompt_info)$(bureau_git_prompt)$(return_status)$(suspend_symbol)$(ssh_prompt_info)'
PROMPT2='$_LIBERTY2 '
PROMPT3='$_LIBERTY3 '
SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [Yes, No, Abort, Edit]? "
