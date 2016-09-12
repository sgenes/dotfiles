# ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]; then
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevars

# if [[ x$WINDOW != x ]]
# then
    # SCREEN_NO="%B$WINDOW%b "
# else
    # SCREEN_NO=""
# fi

# Setup the prompt with pretty colors
