# enables cycling through the directory stack using
# Ctrl+Shift+Left/Right
#
# left/right direction follows the order in which directories
# were visited, like left/right arrows do in a browser

# NO_PUSHD_MINUS syntax:
#  pushd +N: start counting from left of `dirs' output
#  pushd -N: start counting from right of `dirs' output

# don't add same dirs to directory stack
setopt pushdignoredups

switch-to-dir() {
	[[ ${#dirstack} -eq 0 ]] && return
	while ! builtin pushd -q $1 &> /dev/null; do
		builtin popd -1 $1
		[[ ${#dirstack} -eq 0 ]] && break
	done
}

insert-cycledleft () {
	emulate -L zsh
	setopt nopushdminus

	builtin pushd -q -0 &>/dev/null || true
	omz_termsupport_precmd
	zle reset-prompt
	sleep 1
	precmd
	zle reset-prompt
}
zle -N insert-cycledleft

insert-cycledright () {
	emulate -L zsh
	setopt nopushdminus

	builtin pushd -q +1 &>/dev/null || true
	zle reset-prompt
	sleep 1
	omz_termsupport_precmd
	precmd
	zle reset-prompt
}
zle -N insert-cycledright


# add key bindings for iTerm2

bindkey "\e[1;6C" insert-cycledleft
bindkey "\e[1;6D" insert-cycledright
