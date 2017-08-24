# oh-my-zsh arc Theme

setopt prompt_subst

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}%B⬡ %b"
ZSH_THEME_NVM_ALTERNATE_PROMPT_PREFIX="%{$fg[red]%}%B⬡ %b"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

### Git master ▾●

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[green]%}git: %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg_bold[yellow]%}≅%{$reset_color%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
ZSH_SUSPEND=" %{$fg[yellow]%}⚐%{$reset_color%}"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
_git_time_since_commit() {
# Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))
    color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL

    if [ $hours -gt 24 ]; then
      commit_age="${days}d"
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m"
    else
      commit_age="${minutes}m"
    fi

    echo " $color$commit_age%{$reset_color%}"
  fi
}

suspend_symbol () {
  local _suspended=""
  if [[ $(jobs -l | wc -l ) -gt 0 ]]; then
    _suspended="$ZSH_SUSPEND"
  fi
  echo $_suspended
}

arc_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  local g=$(command git rev-parse --git-dir 2> /dev/null)
  local r=""
  if [ -d "$g/rebase-merge" ]; then
    if [ -f "$g/rebase-merge/interactive" ]; then
      r="|REBASE-i"
    else
      r="REBASE-m"
    fi
  else
    if [ -d "$g/rebase-apply" ]; then
      if [ -f "$g/rebase-apply/rebasing" ]; then
        r="|REBASE"
      elif [ -f "$g/rebase-apply/applying" ]; then
        r="|AM"
      else
        r="|AM/REBASE"
      fi
    elif [ -f "$g/MERGE_HEAD" ]; then
      r="|MERGING"
    elif [ -f "$g/CHERRY_PICK_HEAD" ]; then
      r="|CHERRY-PICKING"
    elif [ -f "$g/REVERT_HEAD" ]; then
      r="|REVERTING"
    elif [ -f "$g/BISECT_LOG" ]; then
      r="|BISECTING"
    fi
  fi
  echo "%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}$r"
}

arc_git_status () {
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
  if $(command git rev-parse --verify refs/stash &> /dev/null); then
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
      _STATUS="$_STATUS"
  fi

  echo $_STATUS
}

arc_git_prompt () {
  local _branch=$(arc_git_branch)
  local _status=$(arc_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="· $_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result "
  fi
  echo $_result
}

_exit_code () {
  local rc=$?
  if [[ $rc -eq 0 ]]; then
    exit="-"
  else
    exit="×"
  fi
  exit="$exit "
  echo $exit
}

_get_path () {
  local _PATH=""
  _PATH="%{$fg[cyan]%}%-50<..<%c%<<%{$reset_color%} "
  echo $_PATH
}

_LIBERTY2="  %{$fg[green]%}>%{$reset_color%}"

ssh_prompt_info () {
    local prompt_host=""
    if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host=""
        echo $prompt_host
    else
        prompt_host=" %{$fg_bold[blue]%}$(hostname -s)%{$reset_color%}"
        echo $prompt_host
    fi
}

PROMPT='$(_exit_code)$(_get_path)$(arc_git_prompt)'
RPROMPT='$(suspend_symbol)$(ssh_prompt_info)$(_git_time_since_commit)'
PROMPT2='$_LIBERTY2 '
SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [Yes, No, Abort, Edit]? "
