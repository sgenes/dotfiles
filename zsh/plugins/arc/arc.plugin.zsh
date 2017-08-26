# oh-my-zsh arc Theme

setopt prompt_subst

zmodload zsh/datetime
zmodload zsh/zle
zmodload zsh/parameter

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz async && async
add-zsh-hook precmd arc_precmd
add-zsh-hook preexec arc_preexec

arc_precmd() {
  arc_cmd_timestamp=
  arc_async_tasks
  arc_render "precmd"
  unset arc_cmd_timestamp
}

arc_preexec() {
  arc_cmd_timestamp=$EPOCHSECONDS
}

arc_async_tasks() {
  (( !${arc_async_init:-0} )) && {
    async_start_worker "arc_prompt" -u -n
    async_register_callback "arc_prompt" arc_async_callback
    arc_async_init=1
  }

  typeset -gA arc_vcs_info
  local -H MATCH
  if ! [[ $PWD = ${arc_vcs_info[pwd]}* ]]; then
    # stop any running async jobs
    async_flush_jobs "arc_prompt"
    arc_vcs_info[top]=
    arc_vcs_info[branch]=
    arc_vcs_info[time]=
  fi
  unset MATCH
  async_job "arc_prompt" arc_async_vcs_info $PWD
  [[ -n $arc_async_vcs_info[top] ]] || return
}

arc_async_vcs_info() {
  builtin cd -q $1 > /dev/null

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' use-simple true
  # only export two msg variables from vcs_info
  zstyle ':vcs_info:*' max-exports 2
  # export branch (%b) and git toplevel (%R)
  zstyle ':vcs_info:git*' formats '%b' '%R'
  zstyle ':vcs_info:git*' actionformats '%b|%a' '%R'

  vcs_info

  local -A info
  info[top]=$vcs_info_last_msg_1_
  info[branch]=$(arc_git_prompt)
  info[time]=$(_git_time_since_commit)

  print -r - ${(@kvq)info}
}

_git_time_since_commit() {
  local ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
  # Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    local last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    local now=$EPOCHSECONDS
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
  local ZSH_SUSPEND=" %{$fg[yellow]%}⚐%{$reset_color%}"
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
  local _INDEX=$(git status --porcelain -b 2> /dev/null)
  local _STATUS=""
  if [[ $_INDEX =~ $'\n[AMRD]. ' ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if [[ $_INDEX =~ $'\n.[MTD] ' ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if [[ $_INDEX =~ '\?\? ' ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if [[ $_INDEX =~ '## .*ahead' ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if [[ $_INDEX =~ '## .*behind' ]]; then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  # if [[ $_STATUS == "" ]]; then
    # _STATUS="$_STATUS"
  # fi

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

_venv_status() {
  if [[ -n $VIRTUAL_ENV ]]; then
    venv_name=" · %{$fg_bold[blue]%}${VIRTUAL_ENV:t}%{$reset_color%}"
  fi
  echo $venv_name
}

arc_async_callback() {
  setopt localoptions noshwordsplit
  local job=$1 code=$2 output=$3 exec_time=$4
  case $job in
    arc_async_vcs_info)
      local -A info
      typeset -gA arc_vcs_info
      info=("${(Q@)${(z)output}}")
      local -H MATCH
      if [[ $info[top] = $arc_vcs_info[top] ]]; then
        if [[ $arc_vcs_info[pwd] = ${PWD}* ]]; then
          arc_vcs_info[pwd]=$PWD
        fi
      else
        arc_vcs_info[pwd]=$PWD
      fi
      unset match
      arc_vcs_info[top]=$info[top]
      arc_vcs_info[branch]=$info[branch]
      arc_vcs_info[time]=$info[time]
      arc_render
      ;;
  esac
}

arc_render() {
  setopt localoptions noshwordsplit
  [[ -n ${arc_cmd_timestamp+x} ]] && [[ $1 != precmd ]] && return
  local -a arc_parts arc_rparts
  arc_parts+=($(_get_path))
  typeset -gA arc_vcs_info
  if [[ -n $arc_vcs_info[branch] ]]; then
    arc_parts+=(" ${arc_vcs_info[branch]% }")
  fi
  if [[ -n $arc_vcs_info[time] ]]; then
    arc_rparts+=("${arc_vcs_info[time]}")
  fi
  arc_rparts+=($(suspend_symbol))
  local -ah ps1
  ps1=(
    ${(j..)arc_parts}
  )
  clps1="${(j..)arc_parts}"
  PROMPT="$clps1$(_venv_status) "
  # PROMPT='$(_get_path)$(_venv_status)'
  RPROMPT="${(j. .)arc_rparts}"
  # RPROMPT='$(suspend_symbol)'
  PROMPT2="  %{$fg[green]%}>%{$reset_color%} "
  SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [Yes, No, Abort, Edit]? "
  local expanded_prompt
  expanded_prompt="${(S%%)PROMPT}"
  if [[ $1 != "precmd" ]] && [[ $arc_last_prompt != $expanded_prompt ]]; then
    zle && zle reset-prompt
  fi
  arc_last_prompt=$expanded_prompt
}
