# get the node.js version
# Dynamically load nvm functions to reduce shell startup
# time.
#
# Copyright 2012, 2017 Aron Griffis <aron@arongriffis.com>, Tamado Sitohang <ramottamado@gmail.com>
# Released under the GNU GPL v3
#######################################################################

# nvm loads really slowly, so load it on demand.
if [[ $(type -w nvm) != "nvm: function" ]]; then
  nvm_funcs=( nvm node npm )

  load_nvm() {
    # If these already exist, then nvm won't override them.
    unset -f "${nvm_funcs[@]}"

    # Attempt to load nvm from its many possible sources...
    _try_source() { [[ -f $1 ]] || return; source "$1"; return 0; }
    _try_source $NVM_DIR/nvm.sh || \
    _try_source $NVM_DIR/bash_completion
    return_status=$?
    unset -f _try_source

    # Chain-load the appropriate function
    "$@"
  }

  for v in "${nvm_funcs[@]}"; do
    eval "$v() { load_nvm $v \"\$@\"; }"
  done
fi

function nvm_prompt_info() {
  [ -f "$HOME/.nvm/nvm.sh" ] || return
  local nvm_prompt
  if [[ $(type -w node) != "node: function" ]]; then
    nvm_prompt=$(node -v 2>/dev/null)
    [[ "${nvm_prompt}x" == "x" ]] && return
    nvm_prompt=${nvm_prompt:1}
    echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${nvm_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
  else
    if [[ -f .nvmrc && -r .nvmrc ]]; then
        nvm_prompt=$(cat .nvmrc)
    else
        nvm_prompt=$(cat $NVM_DIR/alias/default)
        nvm_prompt=${nvm_prompt:1}
    fi
    echo "${ZSH_THEME_NVM_ALTERNATE_PROMPT_PREFIX}${nvm_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
  fi
}

autoload -U add-zsh-hook
load-nvmrc() {
	if [[ -f .nvmrc && -r .nvmrc ]]; then
		nvm use $(cat .nvmrc) --silent
	elif [[ $(type -w node) == "node: command" ]]; then
		if [[ $(nvm version) != $(nvm version default) ]]; then
			nvm use default --silent
		fi
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
