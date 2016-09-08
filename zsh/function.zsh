function command_not_found_handler {
	if [[ -x /usr/lib/command-not-found ]] ; then
		/usr/lib/command-not-found -- "$1"
		return 0
	else
		printf "%s: command not found\n" "$1" >&2
		return 127
	fi
}

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

autoload -U add-zsh-hook
load-nvmrc() {
	if [[ -f .nvmrc && -r .nvmrc ]]; then
		nvm use $(cat .nvmrc) --silent
	elif [[ $(nvm version) != $(nvm version default)  ]]; then
		nvm use default --silent
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
