# oh-my-zsh arc Theme

setopt prompt_subst

_git_time_since_commit() {
  local ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
  local ZSH_SUSPEND=" %{$fg[yellow]%}⚐%{$reset_color%}"
  # Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    local last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    local now=$(date +%s)
    local seconds_since_last_commit=$((now-last_commit))

    # Totals
    local minutes=$((seconds_since_last_commit / 60))
    local hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    local days=$((seconds_since_last_commit / 86400))
    local sub_hours=$((hours % 24))
    local sub_minutes=$((minutes % 60))
    local color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL

    # Show age
    local commit_age=""
    if [ $hours -gt 24 ]; then
      commit_age="${days}d"
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m"
    else
      commit_age="${minutes}m"
    fi

    echo "$color$commit_age%{$reset_color%}"
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
  local ref=""
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
  echo "%{$fg_bold[green]%}%-45<..<${ref#refs/heads/}%<<%{$reset_color%}$r"
}

### Git master ●▾

arc_git_status () {
  local ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}▴%{$reset_color%}"
  local ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[magenta]%}▾%{$reset_color%}"
  local ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
  local ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
  local ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
  local _INDEX=$(command git status --porcelain -b 2> /dev/null)
  local _STATUS=""
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
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

_get_path () {
  local _PATH=""
  _PATH="%{$fg[cyan]%}%-60<..<%c%<<%{$reset_color%} "
  echo $_PATH
}

PROMPT='$(_get_path)'
RPROMPT='$(suspend_symbol)'
PROMPT2="  %{$fg[green]%}>%{$reset_color%} "
SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [Yes, No, Abort, Edit]? "

ASYNC_PROC=0
function precmd() {
  function async() {
    printf "%s" "$(arc_git_prompt)" > "/tmp/git_prompt_$$"
    printf "%s" "$(_git_time_since_commit)" > "/tmp/time_commit_$$"
    kill -s USR1 $$
  }
  if [[ "${ASYNC_PROC}" != 0 ]]; then
    kill -s HUP $ASYNC_PROC > /dev/null 2>&1 || :
  fi
  async &!
  ASYNC_PROC=$!
}

function TRAPUSR1() {
  PROMPT="$(_get_path)$(cat /tmp/git_prompt_$$)"
  RPROMPT="$(cat /tmp/time_commit_$$)$(suspend_symbol)"
  ASYNC_PROC=0
  zle && zle reset-prompt
}
