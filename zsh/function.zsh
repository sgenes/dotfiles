function command_not_found_handler {
	if [[ -x /usr/lib/command-not-found ]] ; then
		/usr/lib/command-not-found -- "$1"
		return 0
	else
		printf "%s: command not found\n" "$1" >&2
		return 127
	fi
}

autoload -U add-zsh-hook
load-nvmrc() {
	if [[ -f .nvmrc && -r .nvmrc ]]; then
		nvm use $(cat .nvmrc)
	elif [[ $(nvm version) != $(nvm version default)  ]]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
